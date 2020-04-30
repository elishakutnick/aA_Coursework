require_relative "pieces"

class Board

  NUM_ROWS = 8
  NUM_COLS = 8 

  def initialize
    @grid = Array.new(NUM_ROWS){ Array.new(NUM_COLS){nil} }
    place_pieces
  end

  def place_pieces
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        if row_idx == 1
          @grid[row_idx][col_idx] = Pawn.new([row_idx, col_idx], self, 'black') 
        elsif row_idx == 6
          @grid[row_idx][col_idx] = Pawn.new([row_idx, col_idx], self, 'white') 
        elsif row_idx == 0 && (col_idx == 0 || col_idx == 7)
          @grid[row_idx][col_idx] = Rook.new([row_idx, col_idx], self, 'black') 
        elsif row_idx == 7 && (col_idx == 0 || col_idx == 7)
          @grid[row_idx][col_idx] = Rook.new([row_idx, col_idx], self, 'white')
        elsif row_idx == 0  && (col_idx == 1 || col_idx == 6)
          @grid[row_idx][col_idx] = Knight.new([row_idx, col_idx], self, 'black') 
        elsif row_idx == 7 && (col_idx == 1 || col_idx == 6)
          @grid[row_idx][col_idx] = Knight.new([row_idx, col_idx], self, 'white')
        elsif row_idx == 0  && (col_idx == 2 || col_idx == 5)
          @grid[row_idx][col_idx] = Bishop.new([row_idx, col_idx], self, 'black') 
        elsif row_idx == 7 && (col_idx == 2 || col_idx == 5)
          @grid[row_idx][col_idx] = Bishop.new([row_idx, col_idx], self, 'white')
        elsif row_idx == 0  && col_idx == 3 
          @grid[row_idx][col_idx] = Queen.new([row_idx, col_idx], self, 'black') 
        elsif row_idx == 7 && col_idx == 3
          @grid[row_idx][col_idx] = Queen.new([row_idx, col_idx], self, 'white')
        elsif row_idx == 0  && col_idx == 4 
          @grid[row_idx][col_idx] = King.new([row_idx, col_idx], self, 'black') 
        elsif row_idx == 7 && col_idx == 4
          @grid[row_idx][col_idx] = King.new([row_idx, col_idx], self, 'white')        
        else
          @grid[row_idx][col_idx] = NullPiece.instance 
        end
      end
    end
  end

  def render
    @grid.each do |row|
      # row [ class1, class2 ]
      puts row.map(&:symbol).join(' ')
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
    self[start_pos] = NullPiece.instance
    return true 
  end

  def valid_move?(end_pos, piece)
     end_row, end_col = end_pos
     if !(0...NUM_ROWS).to_a.include?(end_row) || !(0...NUM_COLS).to_a.include?(end_col)
      return false 
     elsif @grid[end_pos].color == piece.color
      return false
     elsif !piece.moves.include?(end_pos)
      return false
     end
     true
  end

end