# Deque

# A deque is a double-ended queue. It is similar to the queue, but you are able to use both ends (front & rear).
# Note: deque is actually pronounced as "deck".

# You can:
# * add_front to add an item to the front of the deque
# * remove_front to remove the front item of the deque
# * peek_front to look at the front-most item

# * add_rear to add an item to the rear of the deque
# * remove_rear to remove the rear item of the deque
# * peek_rear to look at the rear-most item

# Deque does not enforce LIFO (last in, first out) or FIFO (first in, first out) usage.

# Sample implementation

class Deque

  # Note:
  #   front is left/first position
  #   back is right/last position

  def initialize
    @collection = []
  end

  # front

  def add_front(element)
    @collection.unshift(element)
  end

  def remove_front
    @collection.shift
  end

  def peek_front
    @collection.first
  end

  # rear

  def add_rear(element)
    @collection.push(element)
  end

  def remove_rear
    @collection.pop
  end

  def peek_rear
    @collection.last
  end

  alias_method :add_back, :add_rear
  alias_method :remove_back, :remove_rear
  alias_method :peek_back, :peek_rear

  # helpers

  def size
    @collection.size
  end

  def is_empty?
    @collection.empty?
  end

end
