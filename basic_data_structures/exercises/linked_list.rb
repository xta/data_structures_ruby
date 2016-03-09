# Exercise: work with linked list(s)

# Notes
# * linked lists allow us to maintain a collection of relative items. there is no requirement that they are in contiguous memory
# * the location of the first item (head) must be tracked
# * each item should know the location of the next item
# * the last item should know that there is no next item

class Node

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

end

class UnorderedList

  attr_accessor :head

  def initialize
    @head = nil
  end

  def is_empty?
    @head.nil?
  end

  # note: adding new node to the top/head of the List for performance reasons.
  # we don't want to iterate through all the elements each time we add a node.

  def add(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end

  alias_method :append, :add

  def size
    current = @head
    count = 0

    while !current.nil?
      count += 1
      current = current.next
    end

    count
  end

  def search?(value)
    index(value) != nil
  end

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
      # 'forget' the current by setting @head as the next node
      @head = current.next
    else
      if current.next
        # 'skip' the current by setting the previous next as the next node
        previous.next = current.next
      else
        # 'forget' the current (last node) by setting the previous next as nil
        previous.next = nil
      end
    end
  end

  def insert(position, value)
    current = @head
    previous = nil
    current_position = 0
    inserted = false
    total_size = size

    while !inserted and position <= total_size
      if current_position == position
        new_node = Node.new(value)
        if previous
          previous.next = new_node
        else
          @head = new_node
        end
        new_node.next = current

        inserted = true
      else
        # move to next node
        current_position += 1
        previous = current
        current = current.next
      end
    end
  end

  def index(value)
    current = @head
    position = 0
    found = false

    while !found and !current.nil?
      if current.value == value
        found = true
      else
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

    while !found and position <= total_size
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
      previous.next = current.next
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

puts "Create a linked list..."
list = UnorderedList.new
p list.to_a
puts


puts "Add nodes..."
list.add(5)
p list.to_a
list.add(9)
p list.to_a
list.add(100)
p list.to_a
puts


puts "Check the size..."
p list.size
puts


puts "Does it contain 100?"
p list.search?(100)
puts "Does it contain 15?"
p list.search?(15)
puts


p list.to_a

puts "Remove 9..."
list.remove(9)
p list.to_a
puts "Remove 55 (an element that doesn't exist)..."
list.remove(55)
p list.to_a
puts "Again, remove 55 (an element that doesn't exist)..."
list.remove(55)
p list.to_a

puts "Insert a node (999) at end..."
list.insert(2, 999)
p list.to_a
puts "Remove 999 (at end)..."
list.remove(999)
p list.to_a
puts


puts "Insert a node at position 2 (index of 1) with value of 7..."
list.insert(1, 7)
p list.to_a
puts "Insert a node at beginning (index of 0) with value of 8..."
list.insert(0, 8)
p list.to_a
puts "Insert a node at end (index of 4) with value of 64..."
list.insert(list.size, 64)
p list.to_a
puts "Insert a node at position 4 (index of 3) with value of 77..."
list.insert(3, 77)
p list.to_a
puts "Insert a node at invalid position (index of 55) with value of 123..."
list.insert(55, 123)
p list.to_a
puts


puts "Find index of valid element 77..."
p list.index(77)
puts "Find index of valid element 8..."
p list.index(8)
puts "Find index of valid element 64..."
p list.index(64)
puts "Find index of invalid element 999..."
p list.index(999)
puts


p list.to_a
to_pop, pop_index = [7, 2]
puts "Pop the element (#{to_pop}) at position 3 (index of #{pop_index})..."
popped = list.pop(pop_index)
puts "Got #{popped}"
puts "Success? #{popped == to_pop}"
p list.to_a
puts

puts "Pop the last element (64)..."
popped = list.pop
puts "Got #{popped}"
puts "Success? #{popped == 64}"
p list.to_a
puts

to_pop, pop_index = [8, 0]
puts "Pop the element (#{to_pop}) at position 1 (index of #{pop_index})..."
popped = list.pop(pop_index)
puts "Got #{popped}"
puts "Success? #{popped == to_pop}"
p list.to_a
puts

