require_relative './nodes.rb'
require 'byebug'

class KnightPathFinder
  attr_reader :starting_position, :considered_positions
  attr_accessor :root_node

  def initialize(starting_position)
    @starting_position = starting_position
    @root_node = PolyTreeNode.new(starting_position)
    @considered_positions = [starting_position]
  end

  def self.valid_moves(pos, starting_pos)
    row, col = pos
    starting_row, starting_col = starting_pos

    return false if (row < 0 || row > 7) && (col < 0 || col > 7 )

    row_moves = row - starting_row
    col_moves = col - starting_col

    if (row_moves == 2 || row_moves == -2) && (col_moves == 1 || col_moves == -1)
      return true
    elsif (row_moves == 1 || row_moves == -1) && (col_moves == 2 || col_moves == -2)
      return true 
    else
      return false
    end
  
  end

  def new_move_positions(pos)
    unless @considered_positions.include?(pos)
      # debugger
      if KnightPathFinder.valid_moves(pos, starting_position)
        considered_positions << pos
        return true
      end
    end
    false
  end

  def build_move_tree
    
    root = PolyTreeNode.new(self.starting_position)
    queue = [root]

    until queue.empty?
      current_node_position = queue.shift
      # what position to send in to new_move_positions
      (0...8).each do |row|
        (0...8).each do |col|
          node_row, node_col = current_node_position.value
          pos = [node_row+row, node_col+col] 
          if new_move_positions(pos)
            next_pos = PolyTreeNode.new(pos)
            current_node_position.add_child(next_pos)
            queue << next_pos
          end
        end
      end
    end

    considered_positions.each do |pos|
      return [] if considered_positions.length == 64
      k = KnightPathFinder.new(pos)
      k.build_move_tree
    end

    
  end
end