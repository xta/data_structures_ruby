require_relative '../queue.rb'

# Queue usage

puts "Create a queue..."
queue = Queue.new
p queue.collection


puts "Enqueue items..."
queue.enqueue(8)
p queue.collection

queue.enqueue(12)
p queue.collection

queue.enqueue(99)
p queue.collection


puts "Dequeue the first item..."
dequeued = queue.dequeue
p queue.collection

puts "Notice the first item (#{dequeued}) is gone from the queue"
puts "Our queue:"
p queue.collection


puts "Peek at the current first item... #{queue.peek}"

puts "Notice the first item was not removed when peeking..."
p queue.collection


puts "Check the size..."
p queue.size


puts "Is it empty?"
p queue.is_empty?
