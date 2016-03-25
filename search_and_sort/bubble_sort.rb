# Bubble Sort

# Bubble sort makes multiple passes through a collection.
# It compares each item with its neighbor. If the two items are out of order, it will swap them. It continues through the entire collection (a pass).
# The largest item (for n-1 collection size) is moved to the end of the collection in each pass.
# The bubble sort is not efficient, but it can be efficient if there are not as many items to sort since it can stop early.

class SimpleBubbleSort

  def initialize(collection)
    @collection = collection
  end

  def sort!
    decremented_size = (1..(@collection.size-1)).to_a.reverse

    decremented_size.each do |pass_number|
      valid_positions = (0..(pass_number-1)).to_a

      valid_positions.each do |position|
        current_value = @collection[position]
        next_value = @collection[position+1]

        if current_value > next_value
          # swap
          @collection[position] = next_value
          @collection[position+1] = current_value
        end
      end
    end
  end

end

# note: ShortingBubbleSort will short circuit (return/finish early) if no swaps are made during that pass

class ShortingBubbleSort

  def initialize(collection)
    @collection = collection
  end

  def sort!
    swapping = true
    pass_number = @collection.size - 1

    while pass_number > 0 and swapping
      swapping = false
      valid_positions = (0..(pass_number-1)).to_a

      valid_positions.each do |position|
        if @collection[position] > @collection[position+1]
          swapping = true
          temporary = @collection[position]
          @collection[position] = @collection[position+1]
          @collection[position+1] = temporary
        end
      end

      pass_number -=1
    end
  end

end
