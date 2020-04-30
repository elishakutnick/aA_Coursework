class Piece
  attr_reader :pos, :board, :color, :symbol
  
  def initialize(pos, board, color)
    @pos = pos
    @board = board 
    @color = color 
  end

  def moves
    raise "Implment a #moves method"
  end


end