class Setup

  def create_blank_grid
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

  def get_user_setup(grid)


    grid
  end

end
