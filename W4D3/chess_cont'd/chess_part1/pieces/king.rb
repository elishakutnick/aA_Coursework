require_relative 'stepable'
require_relative 'piece'
class King < Piece
  include Stepable

  MOVE_DIFFS = 
  [
    [1, 1],
    [-1,-1],
    [1, 0],
    [-1,0],
    [0,-1],
    [0, 1],
    [1,-1],
    [-1, 1]
  ]

  def initialize(pos, board, color)
    super
    @symbol = color == 'black' ? '♞': '♘'
  end

  def move_diffs
    MOVE_DIFFS
  end

end