class Session

  def self.play(grid)
    grid.each do |coordinates, value|
      x_coordinate = coordinates[0]
      y_coordinate = coordinates[1]
      neighbors_values = []
      living_neighbors = 0
      neighbors_x = [x_coordinate - 1, x_coordinate, x_coordinate + 1]
      neighbors_y = [y_coordinate - 1, y_coordinate, y_coordinate + 1]

      neighbors_x.each do |neighbor_x|
        neighbors_y.each do |neighbor_y|
          neighbor_value = grid[[neighbor_x,neighbor_y]]
          neighbors_values.push(neighbor_value)
        end
      end

      living_neighbors = neighbors_values.count("+")

      if value == "+"
        case
        when living_neighbors > 3
          then grid[coordinates] = "."
        when living_neighbors > 1
          grid[coordinates] = "+"
        else
          grid[coordinates] = "."
        end
      elsif living_neighbors == 3
        grid[coordinates] = "+"
      elsif value == "."
        grid[coordinates] = "."
      end

    end

    grid
  end

  def display(grid)

  end

  def run_status

    run_status
  end

end
