# Stack

# A stack is a linear data structure. Linear data structures are 1 dimensional, for example: top to bottom (or left to right).

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
