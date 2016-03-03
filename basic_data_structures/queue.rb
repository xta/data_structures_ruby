# Queue

# A queue is a linear data structure. Linear data structures are 1 dimensional, for example: top to bottom (or left to right).

# You can:
# * enqueue to add a new item to the rear/back
# * dequeue to remove the front item
# * peek to look at the front-most item

# Queue is in a FIFO (first in, first out) order.

# Sample implementation

class Queue

  attr_reader :collection

  def initialize
    @collection = []
  end

  def enqueue(element)
    @collection.push(element)
  end

  def dequeue
    @collection.shift
  end

  def peek
    @collection[ 0 ]
  end

  def is_empty?
    @collection.empty?
  end

  def size
    @collection.size
  end

end
