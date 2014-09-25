require "minitest/autorun"
require "Conway"
require "session"
require "setup"

class ConwayTest < MiniTest::Unit::TestCase
  def test_setup_create_blank_grid
    assert Setup.new.create_blank_grid.is_a?(Hash), "Blank grid"
  end
end
