require "session"
require "setup"

class Conway

  def initialize
    @grid = Hash.new
  end

  def run
    setup = Setup.new(@grid)
    @grid = setup.run
    session = Session.new(@grid)
    loop do
      session.run
      sleep(1)
      system("stty raw -echo")
      char = STDIN.read_nonblock(1) rescue nil
      system("stty -raw echo")
      break if /q/i =~ char
    end
  end
end
