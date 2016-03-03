require_relative '../deque.rb'

# output helper

def display_internal_state(d)
  p d.instance_variable_get(:@collection)
end

# Deque usage

puts "Create a deque..."
deque = Deque.new
display_internal_state(deque)
puts

puts "Add items (1, 2, 3) to the front..."
deque.add_front(1)
display_internal_state(deque)
deque.add_front(2)
display_internal_state(deque)
deque.add_front(3)
display_internal_state(deque)
puts

puts "Add items (52, 53, 54) to the rear..."
deque.add_rear(52)
display_internal_state(deque)
deque.add_rear(53)
display_internal_state(deque)
deque.add_rear(54)
display_internal_state(deque)
puts

puts "Remove the front item..."
front = deque.remove_front
display_internal_state(deque)
puts "Notice the front item (#{front}) is gone from the deque"
puts

puts "Remove the rear item..."
rear = deque.remove_rear
display_internal_state(deque)
puts "Notice the rear item (#{rear}) is gone from the deque"
puts

front_peek = deque.peek_front
puts "Peek at the first item... (#{front_peek})"
display_internal_state(deque)
puts "Notice the front item (#{front_peek}) remains"
puts

rear_peek = deque.peek_rear
puts "Peek at the rear item... (#{rear_peek})"
display_internal_state(deque)
puts "Notice the rear item (#{rear_peek}) remains"
puts

puts "Check the size..."
display_internal_state(deque)
puts deque.size
puts

puts "Is it empty?"
display_internal_state(deque)
puts deque.is_empty?
puts
