# PriorityQueue

# A priority queue is similar to a queue, where items are removed from the front of the list (FIFO).
# In a priority queue, each element has a priority.
# The items in the priority queue are ordered by priority.
# The first item to be removed is the one with the highest priority.

class PriorityQueue

  attr_reader :collection

  def initialize
    @collection = [nil]
  end

  def <<(element)
    @collection << element
    bubble_up(@collection.size - 1)
  end

  def pop
    exchange(1, @collection.size - 1)
    max = @collection.pop
    bubble_down(1)
    max
  end

  private

  def bubble_up(index)
    parent_index = (index / 2)

    return if index <= 1
    return if @collection[parent_index] >= @collection[index]

    exchange(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = (index * 2)

    return if child_index > @collection.size - 1

    not_the_last_element = child_index < @collection.size - 1
    left_element = @collection[child_index]
    right_element = @collection[child_index + 1]
    child_index += 1 if not_the_last_element && right_element > left_element

    return if @collection[index] >= @collection[child_index]

    exchange(index, child_index)
    bubble_down(child_index)
  end

  def exchange(source, target)
    @collection[source], @collection[target] = @collection[target], @collection[source]
  end
end
