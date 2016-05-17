# A binary heap is a binary tree with two additional constraints:
## * All levels of the tree, except the last (deepest) level is fully filled. If the last level is not full, it is filled from left to right.
## * All nodes are either "greater than or equal to" (max heap) or "less than or equal to" (min heap) each of their children.

# We are making a min heap.
# For example, a min heap can look like:
#             1
#           /   \
#         2       3
#       /   \    /  \
#      17   19  36   7
#     /  \
#    25   100

# We can represent a binary heap as a simple array.
# The children of a node at a given index i will always be in 2i and 2i + 1.
# The same way, the parent of this node will be at the index i/2.

module BinaryHeap

  class Min
    def initialize
      @collection = [nil]
    end

    def load_from_collection(collection)
      index = collection.size/2
      @collection = [nil] + collection

      while index > 0
        percolate_down(index)
        index -= 1
      end
    end

    def <<(value)
      @collection.push(value)
      percolate_up(max_possible_index)
    end

    def delete_minimum
      swap(1, max_possible_index)
      minimum = @collection.pop

      percolate_down(1)
      minimum
    end

    # helpers to visualize the tree structure

    def parent(child_index)
      parent_index = child_index/2
      return if max_possible_index < parent_index

      @collection[parent_index]
    end

    def children(parent_index)
      return if max_possible_index < parent_index
      children = []

      left_node_index = parent_index*2
      if left_node_index <= max_possible_index
        children << @collection[left_node_index]
      else
        children << nil
      end

      right_node_index = parent_index*2+1
      if right_node_index <= max_possible_index
        children << @collection[right_node_index]
      else
        children << nil
      end

      children
    end

    private

    def max_possible_index
      @collection.size - 1
    end

    def percolate_up(index)
      return if index <= 1

      parent_index = index/2
      return if @collection[parent_index] <= @collection[index]

      swap(index, parent_index)
      percolate_up(parent_index)
    end

    def percolate_down(index)
      child_index = index*2
      return if child_index > max_possible_index

      child_index = minimum_child_index(index)
      return if @collection[index] <= @collection[child_index]

      swap(index, child_index)
      percolate_down(child_index)
    end

    def minimum_child_index(parent_index)
      if parent_index*2+1 > @collection.size
        parent_index*2
      else
        if @collection[parent_index*2] < @collection[parent_index*2+1]
          parent_index*2
        else
          parent_index*2+1
        end
      end
    end

    def swap(source, target)
      @collection[source], @collection[target] = @collection[target], @collection[source]
    end

  end

end
