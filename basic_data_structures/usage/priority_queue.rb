require_relative '../priority_queue.rb'

class Item
  include Comparable

  attr_accessor :name, :priority

  def initialize(name, priority)
    @name = name
    @priority = priority
  end

  def <=>(other)
    @priority <=> other.priority
  end
end

puts "Create priority queue"
pq = PriorityQueue.new

puts "Add 3 elements"
pq << Item.new("a", 5)
pq << Item.new("b", 20)
pq << Item.new("c", 3)

puts "Remove the highest priority (first) element"
p pq.pop.priority
