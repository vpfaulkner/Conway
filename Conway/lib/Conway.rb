class Conway
  def run
    grid = Setup.new.create_blank_grid
    grid = setup.get_user_setup(grid)
    run_status = nil
    until run_status == "Over"
      session = Session.new(grid)
      grid = session.play(grid)
      session.display(grid)
      run_status = session.run_status
    end
  end
end
