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

      system("stty raw -echo")
      char = STDIN.read_nonblock(1) rescue nil
      system("stty -raw echo")
      break if /q/i =~ char
      
    end
  end
end
