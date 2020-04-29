class Bishop < Piece 
  include Slideable
  
  def initialize(pos, board, color)
    super
  end

  def move_dirs
    ['diagonal']
  end


end