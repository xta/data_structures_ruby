require_relative '../binary_heap.rb'

# output helper

def display_internal_state(bh)
  p bh.instance_variable_get(:@collection)
  puts
end

def get_internal_element(bh, index)
  bh.instance_variable_get(:@collection)[index]
end

# BinaryHeap usage

puts "Create a binary min heap"
puts "Add values to the binary min heap:"

bh = BinaryHeap::Min.new

bh << 2
display_internal_state(bh)

bh << 4
display_internal_state(bh)

bh << 1
display_internal_state(bh)

bh << 3
display_internal_state(bh)

bh << 8
display_internal_state(bh)

puts "Get parent of 3rd element:"
# 3rd element = index of 2
p bh.parent(2)

puts "Get children of 2nd element (#{get_internal_element(bh, 1)}):"
# 2nd element = index of 1
p bh.children(1)

puts "Get children of 3rd element (#{get_internal_element(bh, 2)}):"
# 3rd element = index of 2
p bh.children(2)

puts "Delete the minimum value (#{bh.delete_minimum})"
display_internal_state(bh)

puts "Delete the minimum value (#{bh.delete_minimum})"
display_internal_state(bh)



puts "---------"
collection = [2,5,6,9,3]
puts "Build a min binary heap from a collection (#{collection})"

bhc = BinaryHeap::Min.new
bhc.load_from_collection(collection)
display_internal_state(bhc)

puts "Get children of 2nd element (#{get_internal_element(bhc, 1)}):"
# 2nd element = index of 1
p bhc.children(1)

puts "Get children of 3rd element (#{get_internal_element(bhc, 2)}):"
# 3rd element = index of 2
p bhc.children(2)
