require_relative '../bubble_sort.rb'

# output helper

def display_internal_state(bs)
  p bs.instance_variable_get(:@collection)
end

# Bubble Sort usage

puts "Sorting using basic Bubble Sort: [54,26,93,17,77,31,44,55,20]..."

simple_bubble_sort = SimpleBubbleSort.new([54,26,93,17,77,31,44,55,20])
simple_bubble_sort.sort!
display_internal_state(simple_bubble_sort)
puts

puts "Sorting using shorting Bubble Sort [20,30,40,90,50,60,70,80,100,110]"
shorting_bubble_sort = ShortingBubbleSort.new([20,30,40,90,50,60,70,80,100,110])
shorting_bubble_sort.sort!
display_internal_state(shorting_bubble_sort)
puts
