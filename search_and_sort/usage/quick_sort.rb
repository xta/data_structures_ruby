require_relative '../quick_sort.rb'

# output helper

def display_internal_state(qs)
  p qs.instance_variable_get(:@collection)
end

# Quick Sort usage

puts "Sorting using Quick Sort: [54,26,93,17,77,31,44,55,20]..."
quick_sort = QuickSort.new([54,26,93,17,77,31,44,55,20])
quick_sort.sort!
display_internal_state(quick_sort)
puts

puts "Sorting using Quick Sort median of three method: [54,26,93,17,77,31,44,55,20]..."
quick_sort = QuickSort.new([54,26,93,17,77,31,44,55,20])
quick_sort.sort_using_median_of_three_method!
display_internal_state(quick_sort)
puts
