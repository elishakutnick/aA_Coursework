require_relative 'slideable'
require_relative 'piece'

class Bishop < Piece 
  include Slideable
  
  def initialize(pos, board, color)
    super
    @symbol = color == 'black' ? '♝' : '♗'
  end

  def move_dirs
    ['diagonal']
  end


end