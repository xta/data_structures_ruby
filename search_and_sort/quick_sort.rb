# Quick Sort

# Quick sort uses a pivot value to split the list.
# The pivot value can be anything (the midpoint value, the first value, etc).
# A partition process moves items to the appropriate position in the list (left or right of the pivot value).

class QuickSort

  def initialize(collection)
    @collection = collection
  end

  def sort!
    @collection = quick_sort(@collection)
  end

  def sort_using_median_of_three_method!
    @collection = quick_sort_using_median_of_three(@collection)
  end

  private

  def quick_sort(list)
    if list.size <= 1
      list
    else
      pivot = list.first
      list.delete_at(0)

      less = []
      greater = []

      list.each do |value|
        if value <= pivot
          less.push value
        else
          greater.push value
        end
      end

      quick_sort(less) + [pivot] + quick_sort(greater)
    end
  end

  # This is a specialized Quick Sort (Median of Three) that looks at the first, last, and middle values.
  # It uses the median of those three values as the pivot.
  def quick_sort_using_median_of_three(list)
    if list.size <= 1
      list
    else
      middle_index = (list.size/2).floor
      middle_value = list[middle_index]

      possible_pivots = {
        0 => list.first,
        list.size-1 => list.last,
        middle_index => middle_value,
      }

      median_value = possible_pivots.values.sort[1]
      median_key = possible_pivots.key(median_value)

      pivot = median_value
      list.delete_at(median_key)

      less = []
      greater = []

      list.each do |value|
        if value <= pivot
          less.push value
        else
          greater.push value
        end
      end

      quick_sort(less) + [pivot] + quick_sort(greater)
    end
  end

end
