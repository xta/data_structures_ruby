# Binary Search

# Binary search uses an ordered collection.
# It starts at the midpoint of the collection.
# If the midpoint item is a match, we are done.
# Else, it looks at whether the item is lower or higher than the midpoint.
# Repeat with the lower or upper half until you find the response (true or false).

# Binary search is O(log n).

class BinarySearch

  def initialize(collection)
    @collection = collection.sort
  end

  def iterative_search?(lookup_item)
    first_index = 0
    last_index = @collection.size
    found = false

    while first_index <= last_index and !found
      midpoint = (first_index + last_index)/2

      if @collection[midpoint] == lookup_item
        found = true
      else
        break unless @collection[midpoint]

        if lookup_item < @collection[midpoint]
          last_index = midpoint - 1
        else
          first_index = midpoint + 1
        end
      end
    end

    found
  end

  alias_method :search?, :iterative_search?

  def recursive_search?(lookup_item)
    recursively_search(@collection, lookup_item)
  end

  private

  def recursively_search(list, item)
    return false if list.size == 0

    midpoint = list.size / 2
    if list[midpoint] == item
      return true
    else
      if item < list[midpoint]
        return recursively_search(list[0..midpoint-1], item)
      else
        return recursively_search(list[midpoint+1..list.size], item)
      end
    end
  end

end
