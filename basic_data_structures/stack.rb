# Stack

# A stack is a linear data structure. Linear data structures have are 2 dimensional, for example: top to bottom (or left to right).

# You can:
# * push to add a new element to the top of the stack
# * pop to remove the top element
# * peek to look at the top element, without popping it off the stack

# Stack is in a LIFO (last in, first out) order. Stacks can be used to reverse the order of items.

# Sample implementation

class Stack

  attr_reader :collection

  def initialize
    @collection = []
  end

  def push(element)
    @collection.push(element)
  end

  def pop
    @collection.pop
  end

  def peek
    @collection[ size-1 ]
  end

  def is_empty?
    @collection.empty?
  end

  def size
    @collection.size
  end

end

# Sample usage

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

puts "Peak at the top item... #{stack.peek}"

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
