require_relative '../list_of_lists.rb'

# output helper

def display_internal_state(bt)
  p bt.tree
  puts
end

# Binary Tree usage

## --- Binary Tree 1

puts "Create a binary tree"
bt = BinaryTree.new(1)
display_internal_state(bt)

puts "Insert left child"
bt.insert_left(bt.tree, 2)
display_internal_state(bt)

puts "Insert right child"
bt.insert_right(bt.tree, 3)
display_internal_state(bt)

puts "Get the root node value"
p bt.node_value(bt.tree)
puts

puts "Update the root node value"
bt.set_node_value(bt.tree, 4)
display_internal_state(bt)

puts "Get the left child"
p bt.get_left_child(bt.tree)
puts

puts "Get the right child"
p bt.get_right_child(bt.tree)
puts

## --- Binary Tree 2

puts
puts "---------"
puts "Another example"

puts "Create a new binary tree"
nbt = BinaryTree.new('a')
display_internal_state(nbt)

puts "Insert left"
nbt.insert_left(nbt.tree, "b")
display_internal_state(nbt)

puts "Insert right"
nbt.insert_right(nbt.tree, "c")
display_internal_state(nbt)

puts "Insert another right"
nbt.insert_right(nbt.get_right_child(nbt.tree), 'd')
display_internal_state(nbt)

puts "Insert another left"
nbt.insert_left(nbt.get_right_child( nbt.get_right_child(nbt.tree) ), 'e')
display_internal_state(nbt)
