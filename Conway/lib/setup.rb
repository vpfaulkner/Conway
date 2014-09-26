class Setup

  def self.create_blank_grid
    grid = Hash.new
    x_array = []
    y_array = []
    20.times do |n|
      x_array.push(n)
      y_array.push(n)
    end

    x_array.each do |x|
      y_array.each do |y|
        grid[[x, y]] = "."
      end
    end

    grid
  end

  def self.adjust_by_one(coordinate_array)
    new_array = []
    coordinate_array.each { |n|
      new_n = n - 1
      new_array.push(new_n)
    }
    new_array
  end

  def self.get_coordinates
    coordinate_array = []
    loop do
      input = gets.chomp
      break if input == "Done"
      input = input.split(", ").map(&:to_i)
      if coordinate_array.include?(input)
        puts "\n\nYou can't put duplicate points!!! Try again.\n\n"
      else
        coordinate_array.push(input)
      end
      puts "\n\nYour coordinates: #{coordinate_array}. Add another or type Done.\n\n"
    end
    coordinate_array.flatten!
    coordinate_array
  end

  def self.get_user_setup(grid)
    puts "\n\n**********************\n\nWelcome to Conway's Game of Life!\n\n**********************\n\nYou have a 20 x 20 grid to play on. Pick a starting point by entering two coordinates seperated by a comma. (ex: 10, 10)\n\n"

    coordinate_array = get_coordinates

    validate = lambda { |n|
      (n >= 1) && (n <= 20)}

    until (coordinate_array.length % 2 == 0) && (coordinate_array.all?(&validate))
      puts "Every point needs two coordinates between 1-20 . Try again."
      coordinate_array = get_coordinates
    end

    coordinate_array = adjust_by_one(coordinate_array)

    points_array = coordinate_array.each_slice(2)
    points_array.each do |coordinate|
      grid[coordinate] = "+"
    end

    grid
  end

end
