require_relative '../map.rb'

def display_internal_state(m)
  puts "Keys: "
  p m.instance_variable_get(:@keys)
  puts "Values: "
  p m.instance_variable_get(:@values)
end

map = Map.new

puts "Adding items into Map..."

map[54] = "cat"
map[26] = "dog"
map[93] = "lion"
map[17] = "tiger"
map[77] = "bird"
map[31] = "cow"
map[44] = "goat"
map[55] = "pig"
map[20] = "chicken"

display_internal_state(map)
puts

puts "More actions..."

puts "What's at key 20?"
puts map[20]
puts

puts "What's at key 17?"
puts map[17]
puts

puts "Overwrite 20 with duck"
map[20] = "duck"
puts map[20]
display_internal_state(map)
puts

puts "What's at key 99?"
p map[99]
puts

puts "What's the size?"
puts map.size
puts

puts "Does the key 20 exist?"
puts map.in?(20)
puts

puts "Does the key 88 exist?"
puts map.in?(88)
puts

puts "Delete key 77"
map.delete(77)
display_internal_state(map)
puts

puts "Delete key 54"
map.delete(54)
display_internal_state(map)
puts

puts "What's the size?"
puts map.size
puts
