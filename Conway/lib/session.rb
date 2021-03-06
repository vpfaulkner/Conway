class Session

  def initialize(grid)
    @grid = grid
  end

  def run
    play
    display
  end

  def play
    new_grid = Hash.new
    @grid.each do |coordinates, value|
      living_neighbors = 0
      living_neighbors = determine_living_neighbors(coordinates)
      create_new_grid(coordinates, value, living_neighbors, new_grid)
    end
    @grid = new_grid
  end

  def determine_living_neighbors(coordinates)
    neighbors_values = []
    x_coordinate = coordinates[0]
    y_coordinate = coordinates[1]
    neighbors_x = [x_coordinate - 1, x_coordinate, x_coordinate + 1]
    neighbors_y = [y_coordinate - 1, y_coordinate, y_coordinate + 1]
    neighbors_x.each do |neighbor_x|
      neighbors_y.each do |neighbor_y|
        neighbor_value = @grid[[neighbor_x,neighbor_y]]
        neighbors_values.push(neighbor_value)
      end
    end
    living_neighbors = neighbors_values.count("+")
  end

  def create_new_grid(coordinates, value, living_neighbors, new_grid)
    if value == "+"
      living_neighbors = (living_neighbors - 1)
      if living_neighbors > 3
        new_grid[coordinates] = "."
      elsif living_neighbors > 1
        new_grid[coordinates] = "+"
      else
        new_grid[coordinates] = "."
      end
    elsif living_neighbors == 3
      new_grid[coordinates] = "+"
    elsif value == "."
      new_grid[coordinates] = "."
    end
  end

  def display
    print "--------------------\n"
    counter = 0
    @grid.each do |coordinates, value|
      counter += 1
      print value
      print "\n" if counter % 20 == 0
    end
  end

end
