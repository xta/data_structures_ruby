require_relative '../selection_sort.rb'

# output helper

def display_internal_state(ss)
  p ss.instance_variable_get(:@collection)
end

# Selection Sort usage

puts "Sorting using Selection Sort: [54,26,93,17,77,31,44,55,20]..."

selection_sort = SelectionSort.new([54,26,93,17,77,31,44,55,20])
selection_sort.sort!
display_internal_state(selection_sort)
puts
