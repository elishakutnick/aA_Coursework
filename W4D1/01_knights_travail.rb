require_relative '00_tree_node'
class KnightPathFinder
  attr_reader :starting_position

  def initialize(starting_position)
    @starting_position = starting_position
    self.build_move_tree
  end
  
  #values in the ree wil lbe positions
  #root node is the knight starting position
  #parent node => child node
  
  def build_move_tree
    @self.root_node = PolyTreeNode.new(starting_position)
  end
end