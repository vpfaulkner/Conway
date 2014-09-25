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

    grid[[5,5]] = "+"
    grid[[5,6]] = "+"
    grid[[5,7]] = "+"
    grid[[7,7]] = "+"
    grid[[6,9]] = "+"
    grid[[9,9]] = "+"
    grid[[9,10]] = "+"
    grid[[9,11]] = "+"
    grid[[11,10]] = "+"
    grid[[18,18]] = "+"
    grid[[16,17]] = "+"
    grid[[18,19]] = "+"
    grid[[17,18]] = "+"

    grid
  end

end
