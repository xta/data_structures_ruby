require_relative './binary_search_tree.rb'

# An AVL Tree is a balanced binary search tree.

# The balance factor for a node is the left subtree height less the right subtree height.
## If the balance factor is positive, the subtree is left heavy.
## If the balance factor is negative, the subtree is right heavy.
## If the balance factor is zero, the tree is in perfect balance.
## We can consider the tree to be balanced when the balance factor is -1, 0, or 1.

class AvlTree < BinarySearchTree

  private

  # override super's place_in_tree to call #update_balance
  def place_in_tree(key, value, node)
    if key < node.key
      if node.has_left_child?
        place_in_tree(key, value, node.left_node)
      else
        node.left_node = TreeNode.new(key, value, nil, nil, node)
        update_balance(node)
      end

    elsif key > node.key
      if node.has_right_child?
        place_in_tree(key, value, node.right_node)
      else
        node.right_node = TreeNode.new(key, value, nil, nil, node)
        update_balance(node)
      end

    else # key == node.key
      node.value = value
    end
  end

  def update_balance(node)
    if (node.balance_factor > 1) || (node.balance_factor < -1)
      rebalance(node)
      return
    end

    if node.parent_node && node.parent_node.balance_factor != 0
      update_balance(node.parent_node)
    end
  end

  def rebalance(node)
    if node.balance_factor < 0
      rotate_right(node.right_node) if node.right_node.balance_factor > 0
      rotate_left(node)
    elsif node.balance_factor > 0
      rotate_left(node.left_node) if node.left_node.balance_factor < 0
      rotate_right(node)
    end
  end

  def rotate_left(node)
    new_root = node.right_node
    node.right_node = new_root.left_node

    if new_root.left_node
      new_root.left_node.parent_node = node
    end

    new_root.parent_node = node.parent_node
    if node.is_root?
      @root_node = new_root
    else
      if node.is_left_child?
        node.parent_node.left_node = new_root
      else
        node.parent_node.right_node = new_root
      end
    end

    new_root.left_node = node
    node.parent_node = new_root
  end

  def rotate_right(node)
    new_root = node.left_node
    node.left_node = new_root.right_node

    if new_root.right_node
      new_root.right_node.parent_node = node
    end

    new_root.parent_node = node.parent_node
    if node.is_root?
      @root_node = new_root
    else
      if node.is_right_child?
        node.parent_node.right_node = new_root
      else
        node.parent_node.left_node = new_root
      end
    end

    new_root.right_node = node
    node.parent_node = new_root
  end

end
