require_relative "board"

# board = Board.new
# p board.move_piece([1,1], [2,1]) #=> true
# p board.move_piece([3,0], [3,1]) #=> error

piece = Bishop.new()
piece.moves #=> [pos1, pos2, pos3]