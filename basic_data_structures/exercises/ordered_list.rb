# Exercise: work with ordered list(s)

# Notes
# * ordered list is a collection of items ordered by some underlying property of the items

# Example (ascending order)
# * This is an ordered list: [1, 2, 3]
# * This is NOT an ordered list: [9, 100, 3, 7]

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class OrderedList

  # Note: we are assuming ascending (1, 2, 3, ...) order

  attr_accessor :head

  def initialize
    @head = nil
  end

  def add(value)
    current = @head
    previous = nil

    while !current.nil?
      break if current.value > value

      previous = current
      current = current.next
    end

    new_node = Node.new(value)

    if previous.nil?
      new_node.next = @head
      @head = new_node
    else
      previous.next = new_node
      new_node.next = current if current
    end
  end

  # same as UnorderedList implementation
  def remove(value)
    current = @head
    previous = nil
    found = false

    while !found
      if current.value == value
        found = true
      else
        break unless current.next

        previous = current
        current = current.next
      end
    end

    return unless found

    if previous.nil?
      @head = current.next
    else
      if current.next
        previous.next = current.next
      else
        previous.next = nil
      end
    end
  end

  def search?(value)
    current = @head
    found = false

    while !found
      if current.value == value
        found = true
      else
        break if current.value > value

        current = current.next
      end
    end

    found
  end

  # same as UnorderedList implementation
  def is_empty?
    @head.nil?
  end

  # same as UnorderedList implementation
  def size
    current = @head
    count = 0

    while !current.nil?
      count += 1
      current = current.next
    end

    count
  end

  def index(value)
    current = @head
    position = 0
    found = false

    while !found and !current.nil?
      if current.value == value
        found = true
      else
        break if current.value > value

        position += 1
        current = current.next
      end
    end

    found ? position : nil
  end

  def pop(position = nil)
    current = @head
    previous = nil

    current_position = 0
    position = size-1 unless position
    total_size = size
    found = false

    while !found and position < total_size
      if current_position == position
        found = true
      else
        previous = current
        current = current.next

        current_position += 1
      end
    end

    return unless found

    if previous.nil?
      @head = current.next
    else
      if current.next
        previous.next = current.next
      else
        previous.next = nil
      end
    end

    current.value
  end

  # helper

  def to_a
    current = @head
    collection = []

    while !current.nil?
      collection << current.value
      current = current.next
    end

    collection
  end

end

# Sample Usage

puts "Create an ordered list..."
list = OrderedList.new
p list.to_a
puts


puts "Add nodes..."
list.add(25)
p list.to_a
list.add(2)
p list.to_a
list.add(77)
p list.to_a
list.add(1)
p list.to_a
list.add(101)
p list.to_a
list.add(50)
p list.to_a
list.add(9)
p list.to_a
list.add(31)
p list.to_a
list.add(55)
p list.to_a
puts


puts "Check the size..."
p list.size
puts


puts "Is it empty?"
p list.is_empty?
puts


puts "Remove 25..."
list.remove(25)
p list.to_a
puts "Remove 101..."
list.remove(101)
p list.to_a
puts "Remove 1..."
list.remove(1)
p list.to_a
puts


puts "Does it contain 77?"
p list.search?(77)
puts "Does it contain 8?"
p list.search?(8)
puts


p list.to_a
puts "Find index of valid element 2..."
p list.index(2)
puts "Find index of valid element 31..."
p list.index(31)
puts "Find index of valid element 77..."
p list.index(77)
puts "Find index of invalid element 999..."
p list.index(999)
puts


p list.to_a
to_pop, pop_index = [55, 4]
puts "Pop the element (#{to_pop}) at position 5 (index of #{pop_index})..."
popped = list.pop(pop_index)
puts "Got #{popped}"
puts "Success? #{popped == to_pop}"
p list.to_a
puts

p list.to_a
to_pop, pop_index = [2, 0]
puts "Pop the element (#{to_pop}) at position 1 (index of #{pop_index})..."
popped = list.pop(pop_index)
puts "Got #{popped}"
puts "Success? #{popped == to_pop}"
p list.to_a
puts

p list.to_a
to_pop, pop_index = [77, 3]
puts "Pop the element (#{to_pop}) at last position..."
popped = list.pop()
puts "Got #{popped}"
puts "Success? #{popped == to_pop}"
p list.to_a
puts
