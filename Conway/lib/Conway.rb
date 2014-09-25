require "session"
require "setup"

class Conway
  def run
    grid = Setup.create_blank_grid
    grid = Setup.get_user_setup(grid) # MAKE RANDOM SETUP LATER
    loop do
      grid = Session.play(grid)
      Session.display(grid)
      sleep(1)
      # ADD BREAK IF INPUT
    end
  end
end
