class Piece
  attr_reader :pos, :board, :color
  def initialize(pos, board, color)
    @pos = pos
    @board = board 
    @color = color 
  end

  def moves
    raise "Implment a #moves method"
  end


end