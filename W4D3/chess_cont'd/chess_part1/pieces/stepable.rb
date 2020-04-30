module Stepable

  def moves
    valid_moves = []

    move_diffs.each do |move|
      new_row = pos[0] + move[0]
      new_col = pos[1] + move[1]
      new_pos = [new_row, new_col]

      if valid_move?(new_pos, self)
        valid_moves << new_pos
      end
    end
    valid_moves
  end

  def move_diffs
    raise 'implement me'
  end

end
