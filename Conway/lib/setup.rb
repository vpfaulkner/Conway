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

  def self.get_coordinates
    coordintate_array = []
    loop do
      input = gets.chomp
      break if input == "Done"
      input = input.split(", ").map(&:to_i)
      coordintate_array.concat(input)
      puts "\n\nYour coordinates: #{coordintate_array.inspect}. Add another or type Done.\n\n"
    end
    coordintate_array
  end

  def self.get_user_setup(grid)
    puts "\n\n**********************\n\nWelcome to Conway's Game of Life!\n\n**********************\n\nYou have a 20 x 20 grid to play on. Pick a starting point by entering two coordinates seperated by a comma. (ex: 10, 10)\n\n"

    coordintate_array = get_coordinates

    validate = lambda { |n|
      (n >= 1) && (n <= 20)}
    puts coordintate_array.inspect
    until (coordintate_array.length % 2 == 0) && (coordintate_array.all?(&validate))
      puts "Every point needs two coordinates between 1-20 . Try again."
      coordintate_array = get_coordinates
    end

    points_array = coordintate_array.each_slice(2)
    points_array.each do |coordinate|
      grid[coordinate] = "+"
    end

    grid
  end

end
