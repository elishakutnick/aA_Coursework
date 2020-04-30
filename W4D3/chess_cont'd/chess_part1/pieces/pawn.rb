require_relative 'piece'

class Pawn < Piece 
  def initialize(pos, board, color)
    super
    @symbol = color == 'black' ? '♟' : '♙'
  end

  def move_dirs
    
  end

  def moves
    side_attacks + forward_steps 
  end


  private
  def at_start_row?
    return true if self.pos[0] == 1 && self.color == 'black'
    return true if self.pos[0] == 6 && self.color == 'white'
    false
  end

  def forward_dir
    foward_dir =  color == 'black' ? 1 : -1
  end

  def forward_steps
    possible_pos = []
    potential_pos = [pos[0], (pos[1] + forward_dir)]
    if board[potential_pos].is_a?(NullPiece)
      possible_pos << potential_pos
      second_potential_pos = [potential_pos[0], potential_pos[1] + forward_dir]
      possible_pos <<  second_potential_pos if at_start_row? && board[second_potential_pos].is_a?(NullPiece)
    end
    possible_pos
  end

  def side_attacks
    possible_pos = []
    potential_moves = [[pos[0] + forward_dir, pos[1] - 1], [pos[0] + forward_dir, pos[1] + 1]]

    potential_moves.each do |potential_move|
      if !board[potential_move].is_a?(NullPiece) && board[potential_move].color != self.color
        possible_pos << potential_moves 
      end
    end
    possible_pos
  end

end