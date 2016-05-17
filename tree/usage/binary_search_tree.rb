require_relative '../binary_search_tree.rb'

puts "Add elements"
bst = BinarySearchTree.new
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
puts

puts "Get elements"
p bst.get(1)
p bst.get(3)
p bst.get(4)
puts

puts "Lookup elements"
p bst.in?(1)
p bst.in?(10)
puts

puts "Empty?"
p bst.empty?
puts

puts "Size?"
p bst.length
puts

puts "Delete by key"
p bst.delete(7)
puts
