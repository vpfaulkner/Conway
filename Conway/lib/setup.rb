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

  def self.get_user_setup(grid)
    puts "Welcome to Conway's Game of Life!\n\nYou have a 20 x 20 grid to play on. Pick your starting point by entering two coordinates seperated by a comma. (ex: 10, 10, 5, 5)"

    coordintate_array = gets.chomp.split(", ").map(&:to_i)

    validate = lambda { |n|
      (n >= 1) && (n <= 20)}

    until (coordintate_array.length % 2 == 0) && (coordintate_array.all?(&validate))
      puts "Every point needs two coordinates between 1-20 . Try again."
      coordintate_array = gets.chomp.split(", ").map(&:to_i)
    end

    points_array = coordintate_array.each_slice(2)
    points_array.each do |coordinate|
      grid[coordinate] = "+"
    end

    grid
  end

end
