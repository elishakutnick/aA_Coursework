module Slideable

  VERTICAL_MOVES = [
    [1, 0],
    [-1, 0],
  ]

  HORIZONTAL_MOVES = [
    [0, -1],
    [0,  1],
  ]

  DIAGONAL_MOVES = [
    [1, -1],
    [1,  1],
    [-1,-1],
    [-1, 1]
  ]

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
    valid_moves
  end


  def vertical_moves
    result = []
    VERTICAL_MOVES.each do |pos_change|
      result += one_way_moves(pos_change[0], pos_change[1])
    end
    result

    # VERTICAL_MOVES.inject([]) {|acc, pos_change| acc + one_way_moves(pos_change[0], pos_change[1]) }
  end

  
  def horizontal_moves
    result = []
    HORIZONTAL_MOVES.each do |pos_change|
      result += one_way_moves(pos_change[0], pos_change[1])
    end
    result
  end


  def diagonal_moves
    result = []
    DIAGONAL_MOVES.each do |pos_change|
      result += one_way_diagonal_moves(pos_change[0], pos_change[1])
    end
    result
  end

  private
  
  def move_dirs
    raise 'implement me'
    #['vertical', 'horizontal', diagonal]
  end


  def one_way_moves(row_change, col_change)
    new_row, new_col = self.pos
    valid_moves = []

    while true
      new_row += row_change
      new_col += col_change
      new_pos = [new_row, new_col]
      if board.valid_move?(new_pos, piece)
        valid_moves << new_pos 
      else
        break
      end
    end
    valid_moves
  end


end
