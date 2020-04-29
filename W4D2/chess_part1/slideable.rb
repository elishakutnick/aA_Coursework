module Slideable

  def moves
    valid_moves = []
    if move_dirs.include?('vertical')
      valid_moves << vertical_moves
    end
    if move_dirs.include?('horizontal')
      valid_moves << horizontal_moves
    end
    if move_dirs.include?('diagonal')
      valid_moves << diagonal_moves
    end
  end

  def move_dirs
    raise 'implement me'
    #['vertical', 'horizontal', diagonal]
  end

  def vertical_moves

  end

  def horizontal_moves

  end

  def diagonal_moves
    # self.board
    # self.pos
    # self.color
    
  end


end
