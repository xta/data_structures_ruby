require_relative '../stack.rb'

# Stack usage

puts "Create a stack..."

stack = Stack.new
p stack.collection

puts "Push items..."

stack.push(1)
p stack.collection

stack.push(5)
p stack.collection

stack.push(8)
p stack.collection

puts "Pop the top item..."
popped = stack.pop
p stack.collection

puts "Notice the top item (#{popped}) is gone from the stack"

puts "Our stack:"
p stack.collection

puts "Peek at the top item... #{stack.peek}"

puts "Notice the top item was not removed when peeking..."
p stack.collection

puts "Check the size..."
p stack.size

puts "Is it empty?"
p stack.is_empty?

puts "Create an empty stack..."
empty_stack = Stack.new
p empty_stack.collection

puts "Is it empty?"
p empty_stack.is_empty?

puts "Check the size..."
p empty_stack.size
