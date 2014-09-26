require "session"
require "setup"

class Conway

  def initialize
    @grid = Hash.new
  end

  def run
    setup = Setup.new(@grid)
    setup.create_blank_grid
    setup.get_user_setup
    @grid = setup.grid
    puts @grid.inspect # DELETE LATER

    session = Session.new(@grid)
    loop do
      session.display
      session.play


      # Session.display(grid)
      # grid = Session.play(grid)
      sleep(1)

      system("stty raw -echo")
      char = STDIN.read_nonblock(1) rescue nil
      system("stty -raw echo")
      break if /q/i =~ char
    end
  end
end
