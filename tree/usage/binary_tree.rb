require_relative '../binary_tree.rb'

puts "Create binary tree with root value of 'a'"
bt = BinaryTree.new('a')

puts "Add left node"
bt.root_node.add_left("b")

puts "Add right node"
bt.root_node.add_right("c")

puts "Add left_node to left_node"
bt.root_node.left_node.add_left("d")

puts "Get root_node value: #{bt.root_node.value}"
