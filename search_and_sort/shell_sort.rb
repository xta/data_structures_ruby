# Shell Sort

# Shell sort starts by sorting pairs of elements far from each other, but gradually reduces that gap between compared elements. Shell sort improves upon the insertion sort by using many smaller sublists, each of which is sorted using an insertion sort.

class ShellSort

  def initialize(collection)
    @collection = collection
  end

  def sort!
    sublist_count = @collection.size/2
    while sublist_count > 0

      0.upto(sublist_count - 1).each do |start_position|
        gap_insertion_sort(@collection, start_position, sublist_count)
      end

      puts "* After incrementing by #{sublist_count}, the collection is #{@collection}"

      sublist_count /= 2
    end
  end

  private

  def gap_insertion_sort(list, start, gap)
    indices = (start+gap...list.size).step(gap).to_a

    indices.each do |index|
      current_value = list[index]
      position = index

      while position >= gap and list[position - gap] > current_value
        list[position] = list[position-gap]
        position -= gap
      end

      list[position] = current_value
    end
  end

end
