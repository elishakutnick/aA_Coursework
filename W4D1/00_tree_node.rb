class PolyTreeNode
  attr_reader :parent, :value
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(other_parent)
    unless parent.nil? #if the parent is not nil
      self.parent.children.delete(self) #delete ourselves..child
    end

    if other_parent == nil
      parent.children.delete(self) #self parent and delete ourseleves
      @parent = nil  #check both ends and disconnect, nil because we are no longer their child
    elsif !other_parent.children.include?(self)
      other_parent.children << self
      @parent = other_parent 
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node) 
    child_node.parent = nil
    raise "Not a real child" unless children.include?(child_node)
  end

  def dfs(target_value)
    current_node = self
    return nil if current_node.nil?
    return current_node if current_node.value == target_value

    current_node.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil 
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty? #[0]
      current_node = queue.shift #    current_node = (0 = q.shift)      []   
      if current_node.value == target_value
        return current_node
      else
        current_node.children.each { |child| queue.push(child) } #[no nodes]
      end
    end
    nil
    
  end


end