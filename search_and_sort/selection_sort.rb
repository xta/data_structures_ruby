# Selection Sort

# Selection sort makes multiple passes through a collection (and is similar to the bubble sort).
# It only makes one swap (of the highest value) in each pass.
# The largest item (for n-1 collection size) is moved to the end of the collection in each pass.

class SelectionSort

  def initialize(collection)
    @collection = collection
  end

  def sort!
    decremented_size = (@collection.size-1).downto(1).each do |fill_position|
      max_position = 0

      valid_positions = 1.upto(fill_position)
      valid_positions.each do |position|
        if @collection[position] > @collection[max_position]
          max_position = position
        end
      end

      temporary = @collection[fill_position]
      @collection[fill_position] = @collection[max_position]
      @collection[max_position] = temporary
    end
  end
end
