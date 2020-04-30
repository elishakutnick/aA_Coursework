require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
  include Slideable

  def initialize(pos, board, color)
    super
    @symbol = color == 'black' ? '♛' : '♕'
  end

  def move_dirs
    ['diagonal', 'horizontal', 'vertical']
  end


end

