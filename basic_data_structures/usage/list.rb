require_relative '../list.rb'

# output helper

def display_internal_state(l)
  p l.instance_variable_get(:@collection)
end

# List usage

puts "Create a list..."
list = List.new
display_internal_state(list)
puts

puts "Add items (8, 9, 30, 76)..."
list.add(8)
display_internal_state(list)
list.add(9)
display_internal_state(list)
list.append(30)
display_internal_state(list)
list.append(76)
display_internal_state(list)
puts

puts "Remove 9..."
list.remove(9)
display_internal_state(list)
puts

puts "See if exists..."
puts "look for 8"
puts list.search?(8)
puts "look for 50"
puts list.search?(50)
puts

puts "Check the size..."
puts list.size
puts

puts "Is it empty?"
puts list.is_empty?
puts

puts "Find the position (0 based index)..."
display_internal_state(list)
puts "position of 8?"
puts list.index(8)
puts "position of 76?"
puts list.index(76)
puts

puts "Insert 24 at 2nd position (index of 1)..."
list.insert(1, 24)
display_internal_state(list)
puts "Insert 57 at 4th position (index of 3)..."
list.insert(3, 57)
display_internal_state(list)
puts

puts "Pop the last item..."
popped = list.pop
puts "Removed #{popped} from the list"
display_internal_state(list)

puts "Pop the 3rd item (index of 2)..."
popped = list.pop(2)
puts "Removed #{popped} from the list"
display_internal_state(list)
puts
