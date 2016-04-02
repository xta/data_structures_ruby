# Merge Sort

# Merge sort uses recursion to split a list into halves. If a list is empty or has one item, it is sorted at that point.
# If a list has more than one item, the list is split into halves that are continuously split.
# Once the havles are sorted, a merge occurs. Merge combines two smaller, sorted lists into a single sorted list.

class MergeSort

  def initialize(collection)
    @collection = collection
  end

  def sort!
    @collection = merge_sort(@collection)
  end

  private

  def merge_sort(list)
    if list.size <= 1
      list
    else
      midpoint = (list.size/2).floor
      left = merge_sort(list[0..midpoint-1])
      right = merge_sort(list[midpoint..list.size])
      merge(left, right)
    end
  end

  def merge(left, right)
    return right if left.empty?
    return left if right.empty?

    if left.first < right.first
      [left.first] + merge(left[1..left.size], right)
    else
      [right.first] + merge(left, right[1..right.size])
    end
  end
end
