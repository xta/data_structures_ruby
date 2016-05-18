require_relative '../avl_tree.rb'

puts "Using a self-balancing AVL Tree:"

at = AvlTree.new

puts "* Add elements..."
at.set(7, "a")
at.set(2, "b")
at.set(8, "c")
at.set(42, "d")
at.set(51, "e")
at.set(11, "f")
at.set(33, "g")
at.set(3, "h")
at.set(71, "i")
at.set(100, "j")
at.set(72, "k")
at.set(1, "l")

puts "* Get height of tree: #{at.root_node.height}"
puts "* Check balance factor of AVT Tree root node #{at.root_node.balance_factor}"
puts

puts "Try this with a non self-balancing Binary Search Tree:"

bst = BinarySearchTree.new

puts "* Add elements..."
bst.set(7, "a")
bst.set(2, "b")
bst.set(8, "c")
bst.set(42, "d")
bst.set(51, "e")
bst.set(11, "f")
bst.set(33, "g")
bst.set(3, "h")
bst.set(71, "i")
bst.set(100, "j")
bst.set(72, "k")
bst.set(1, "l")

puts "* Get height of tree: #{bst.root_node.height}"
puts "* Check balance factor of BST root node #{bst.root_node.balance_factor}"
puts
