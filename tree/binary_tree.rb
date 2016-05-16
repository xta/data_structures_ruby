# a Binary Tree implementation method using objects that reference each other as nodes.
# a binary tree has at most 2 children nodes for each node.

class BinaryTree

  attr_reader :root_node

  def initialize(root_node_value)
    @root_node = Node.new(root_node_value)
  end

end

class Node

  attr_accessor :value, :left_node, :right_node

  def initialize(value, left_node = nil, right_node = nil)
    @value = value
    @left_node = left_node
    @right_node = right_node
  end

  def add_left(left_node_value)
    new_node = self.class.new(left_node_value)

    if @left_node.nil?
      @left_node = new_node
    else
      # insert a new node between self node and previous left_node
      new_node.left_node = @left_node
      @left_node = new_node
    end
  end

  def add_right(right_node_value)
    new_node = self.class.new(right_node_value)

    if @right_node.nil?
      @right_node = new_node
    else
      # insert a new node between self node and previous right_node
      new_node.right_node = @right_node
      @right_node = new_node
    end
  end

end
