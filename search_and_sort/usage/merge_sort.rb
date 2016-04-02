require_relative '../merge_sort.rb'

# output helper

def display_internal_state(ms)
  p ms.instance_variable_get(:@collection)
end

# Merge Sort usage

puts "Sorting using Merge Sort: [54,26,93,17,77,31,44,55,20]..."

merge_sort = MergeSort.new([54,26,93,17,77,31,44,55,20])
merge_sort.sort!
display_internal_state(merge_sort)
puts
