require_relative 'stepable'
require_relative 'piece'
class Knight < Piece
  include Stepable

    MOVE_DIFFS = 
    [
      [2, 1],
      [2, -1],
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2],
      [-2, 1],
      [-2, -1]
    ]

  def initialize(pos, board, color)
    super
    @symbol = color == 'black' ? '♚' : '♔'
  end
  
  def move_diffs
    MOVE_DIFFS
  end


end