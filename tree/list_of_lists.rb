# list of lists is a crude Binary Tree implementation method
# using an array for each subtree.

# a binary tree has at most 2 children nodes for each node.

class BinaryTree

  attr_reader :tree

  VALUE_POSITION  = 0
  LEFT_POSITION   = 1
  RIGHT_POSITION  = 2

  def initialize(root_value)
    @root_value = root_value
    @tree = [@root_value, [], []]
  end

  def insert_left(the_tree, left_node_value)
    left_node = the_tree[LEFT_POSITION]

    if left_node.size > 1
      the_tree[LEFT_POSITION] = [left_node_value, left_node, []]
    else
      the_tree[LEFT_POSITION] = [left_node_value, [], []]
    end

    the_tree
  end

  def insert_right(the_tree, right_node_value)
    right_node = the_tree[RIGHT_POSITION]

    if right_node.size > 1
      the_tree[RIGHT_POSITION] = [right_node_value, [], the_tree]
    else
      the_tree[RIGHT_POSITION] = [right_node_value, [], []]
    end

    the_tree
  end

  def node_value(the_tree)
    the_tree[VALUE_POSITION]
  end

  def set_node_value(the_tree, new_value)
    the_tree[VALUE_POSITION] = new_value
  end

  def get_left_child(the_tree)
    the_tree[LEFT_POSITION]
  end

  def get_right_child(the_tree)
    the_tree[RIGHT_POSITION]
  end

end
