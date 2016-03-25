require_relative '../insertion_sort.rb'

# output helper

def display_internal_state(is)
  p is.instance_variable_get(:@collection)
end

# Insertion Sort usage

puts "Sorting using Insertion Sort: [54,26,93,17,77,31,44,55,20]..."

insertion_sort = InsertionSort.new([54,26,93,17,77,31,44,55,20])
insertion_sort.sort!

display_internal_state(insertion_sort)
puts
