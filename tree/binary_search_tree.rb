require_relative './binary_tree.rb'

# A binary search tree stores items in memory.
# Binary search trees allow fast lookup, addition, and removal of items.

# Binary search trees rely on sorted keys.
# Keys that are less than the parent are in the left subtree.
# Keys that are more than the parent are in the right subtree.

class BinarySearchTree

  attr_reader :root_node

  def initialize
    @root_node = nil
    @size = 0
  end

  def set(key, value)
    if @root_node
      place_in_tree(key, value, @root_node)
    else
      @root_node = TreeNode.new(key, value)
    end

    @size += 1
  end

  def get(key)
    if @root_node
      result = find_in_tree(key, @root_node)
      result ? result.value : nil
    else
      nil
    end
  end

  def delete(key)
    return false unless in?(key)

    if length > 1
      node_to_remove = find_in_tree(key, @root_node)
      remove(node_to_remove)
      @size -= 1

    elsif length == 1 && @root_node.key == key
      @root_node = nil
      @size = 0
    end

    true
  end

  def length
    @size
  end

  def in?(key)
    get(key) ? true : false
  end

  def empty?
    @size <= 0
  end

  private

  def place_in_tree(key, value, node)
    if key < node.key
      if node.has_left_child?
        place_in_tree(key, value, node.left_node)
      else
        node.left_node = TreeNode.new(key, value, nil, nil, node)
      end

    elsif key > node.key
      if node.has_right_child?
        place_in_tree(key, value, node.right_node)
      else
        node.right_node = TreeNode.new(key, value, nil, nil, node)
      end

    else # key == node.key
      node.value = value
    end
  end

  def find_in_tree(key, node)
    return nil unless node

    if node.key == key
      node

    elsif key < node.key
      find_in_tree(key, node.left_node)

    else # key > node.key
      find_in_tree(key, node.right_node)

    end
  end

  def remove(node)

    # no children
    if node.is_leaf?
      if node == node.parent_node.left_node
        node.parent_node.left_node = nil
      else
        node.parent_node.right_node = nil
      end

    # 2 children
    elsif node.has_both_children?
      successor = node.find_successor
      successor.splice_out
      node.key = successor.key
      node.value = successor.value

    else
    # 1 child
    # promote the child to parent

      if node.has_left_child?
        if node.is_left_child?
          node.left_node.parent_node = node.parent
          node.parent_node.left_node = node.left_node

        elsif node.is_right_child?
          node.left_node.parent_node = node.parent
          node.parent_node.right_node = node.left_node

        else
          node.update_node(node.left_node.key, node.left_node.value, node.left_node.left_node, node.left_node.right_node)

        end

      else
      # node has right child

        if node.is_left_child?
          node.right_node.parent_node = node.parent_node
          node.parent_node.left_node = node.right_node

        elsif node.is_right_child?
          node.right_node.parent_node = node.parent_node
          node.parent_node.right_node = node.right_node

        else
          node.update_node(node.right_node.key, node.right_node.value, node.right_node.left_node, node.right_node.right_node)
        end

      end

    end
  end

end

class TreeNode

  attr_accessor :key, :value, :left_node, :right_node, :parent_node

  def initialize(key, value, left_node = nil, right_node = nil, parent_node = nil)
    @key = key
    @value = value
    @left_node = left_node
    @right_node = right_node
    @parent_node = parent_node
  end

  def has_left_child?
    @left_node
  end

  def has_right_child?
    @right_node
  end

  def is_left_child?
    @parent_node && @parent_node.left_node == self
  end

  def is_right_child?
    @parent_node && @parent_node.right_node == self
  end

  def is_root?
    !@parent_node
  end

  def is_leaf?
    !has_any_children?
  end

  def has_any_children?
    @left_node || @right_node
  end

  def has_both_children?
    @left_node && @right_node
  end

  def update_node(key, value, left_node, right_node)
    @key = key
    @value = value
    @left_node = left_node
    @right_node = right_node
    @left_node.parent_node = self if has_left_child?
    @right_node.parent_node = self if has_right_child?
  end

  # balance methods

  def height
    if is_leaf?
      0
    else
      [left_node, right_node].collect {|n| n.nil? ? 0 : n.height + 1 }.max
    end
  end

  def balance_factor
    left_height = left_node ? left_node.height : 0
    right_height = right_node ? right_node.height : 0
    left_height - right_height
  end

  # successor methods

  def find_successor
    successor = nil

    if has_right_child?
      successor = right_node.find_minimum
    else
      if parent_node
        if is_left_child?
          successor = parent_node
        else
          parent_node.right_node = nil
          successor = parent_node.find_successor
          parent_node.right_node = self
        end
      end
    end

    successor
  end

  def find_minimum
    current = self
    while current.has_left_child?
      current = current.left_node
    end
    current
  end

  def splice_out

    if is_leaf?
      if is_left_child?
        parent_node.left_node = nil
      else # is right child
        parent_node.right_node = nil
      end
    elsif has_any_children?
      if has_left_child?
        if is_left_child?
          parent_node.left_node = left_node
        else
          parent_node.right_node = left_node
        end
        left_node.parent_node = parent_node

      else # has right_child
        if is_left_child?
          parent_node.left_node = right_node
        else
          parent_node.right_node = right_node
        end
        right_node.parent_node = parent_node

      end
    end
  end

end
