require_relative '../binary_tree.rb'

# Exercise: traverse the tree in different ways: preorder, inorder, postorder.

## For traversal, there are three things that need to be done at each tree node:
##  * display the payload of the load
##  * traverse the left subtree
##  * traverse the right subtree

# As part of a depth-first search, the three different ways operate in the following order:

## Pre-order
###  * display the payload of the load
###  * traverse the left subtree
###  * traverse the right subtree

## In-order
###  * traverse the left subtree
###  * display the payload of the load
###  * traverse the right subtree

## Post-order
###  * traverse the left subtree
###  * traverse the right subtree
###  * display the payload of the load

puts "Create a tree"

tree = Node.new('0')
tree.add_left('1')
tree.add_right('2')

tree.left_node.add_left('1.1')
tree.left_node.add_right('1.2')
tree.left_node.right_node.add_left('1.2.1')
tree.left_node.right_node.add_right('1.2.2')

tree.right_node.add_left('2.1')
tree.right_node.add_right('2.2')
tree.right_node.right_node.add_left('2.2.1')
tree.right_node.right_node.add_right('2.2.2')

puts "Traverse nodes in preorder:"

def preorder(node)
  if node
    puts " " + node.value
    preorder(node.left_node)
    preorder(node.right_node)
  end
end

preorder(tree)

puts "Traverse nodes in inorder:"

def inorder(node)
  if node
    preorder(node.left_node)
    puts " " + node.value
    preorder(node.right_node)
  end
end

inorder(tree)

puts "Traverse nodes in postorder:"

def postorder(node)
  if node
    postorder(node.left_node)
    postorder(node.right_node)
    puts " " + node.value
  end
end

postorder(tree)
