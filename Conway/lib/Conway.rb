class Conway
  def run
    grid = Setup.create_blank_grid
    grid = Setup.get_user_setup(grid) # MAKE RANDOM SETUP LATER
    run_status = nil
    loop do
      grid = Session.play(grid)
      Session.display(grid)
      run_status = Session.run_status
      sleep(1)
      # ADD BREAK IF INPUT
    end
  end
end
