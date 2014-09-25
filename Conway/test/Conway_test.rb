require "minitest/autorun"
require "conway"
require "session"
require "setup"

class ConwayTest < MiniTest::Unit::TestCase
  def test_setup_create_blank_grid
    grid = Setup.create_blank_grid

    assert grid.is_a?(Hash), "Blank grid"
  end

  def test_setup_get_user_setup
    grid = Setup.create_blank_grid
    grid = Setup.get_user_setup(grid)

    assert_equal 6, grid.values.count("+")
  end

  def test_session_play
    grid = Setup.create_blank_grid
    grid = Setup.get_user_setup(grid)
    grid = Session.play(grid)

    assert grid.values.count("+") > 0, "Living grid"
  end

  def test_session_display
    grid = Setup.create_blank_grid
    grid = Setup.get_user_setup(grid)
    grid = Session.play(grid)

    assert Session.display(grid), "Displayed"
  end

end
