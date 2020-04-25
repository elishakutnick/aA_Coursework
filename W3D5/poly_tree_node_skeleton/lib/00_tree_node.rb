require 'byebug'
require_relative './queue'

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

  def dfs(node, value)
    return nil if node.nil?
    return node if node.value == value

    children.each do |child|
      dfs(child,value)
    end
    nil 
  end

  def bfs(node, value)
    node.enqueue

    until queue.empty?
      front = node.dequeue 
      if front == value
        return node
      else
        node.children.each { |child| child.enqueue } 
      end
    end
    
  end


end