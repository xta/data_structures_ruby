# Insertion Sort

# Insertion sort goes through the collection maintaining a sorted subset of the collection.
# For example, going from left to right, the left side of the collection will be sorted and gradually expand to take over the whole collection.
# Inserting is generally more performant than swapping (such as with a Bubble Sort).

class InsertionSort

  def initialize(collection)
    @collection = collection
  end

  def sort!
    sizes = 1.upto(@collection.size-1)

    sizes.each do |index|
      current_value = @collection[index]
      position      = index

      while position > 0 and @collection[position-1] > current_value
        # overwrite the value at position with the previous position's value
        # by moving/copying the position's value to position-1
        # note: overwriting here introduces duplicate values
        @collection[position] = @collection[position-1]
        position -= 1
      end

      # note: the position gets decremented in the while loop (above)
      # and it stops decrementing when the current_value is bigger

      # fix the current_value so that:
      # 1.) the current value is not longer missing
      # 2.) there are no duplicate values
      @collection[position] = current_value
    end
  end

end
