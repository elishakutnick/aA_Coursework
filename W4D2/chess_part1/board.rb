require_relative "piece"
require_relative "null_piece"

class Board

  def initialize
    @grid = Array.new(8){ Array.new(8){nil} }
    place_pieces
  end

  def place_pieces
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        if [0,1,6,7].include?(row_idx)
          @grid[row_idx][col_idx] = Piece.new() 
        else
          @grid[row_idx][col_idx] = NullPiece.new() 
        end
      end
    end
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    @grid[row][col]
  end

  def []=(pos, piece)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = piece 
  end

  def move_piece(start_pos, end_pos)
    raise "No piece placed in start position" if self[start_pos].is_a?(NullPiece)
    raise "Piece cannot be moved to end position" if !valid_move?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new()
    return true 
  end

  def valid_move?(pos)
    return true #need to come back to this
  end

end