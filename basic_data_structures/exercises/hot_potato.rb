require_relative '../queue.rb'

# Exercise: simulate a simple hot potato game
# * when the action stops, the person who has the potato is removed
# * the last person standing wins

class HotPotatoSimulator

  def initialize(names, cull_number)
    @names = names
    @cull_number = cull_number
  end

  def run
    queue = Queue.new

    @names.each do |name|
      queue.enqueue(name)
    end

    while queue.size > 1
      cycle_queue(queue, @cull_number)
      queue.dequeue
    end

    queue.dequeue
  end

  private

  def cycle_queue(queue, cycle_number)
    iterations = (1..cycle_number).to_a
    iterations.each do |iteration|
      queue.enqueue(queue.dequeue)
    end
  end

end

names = %w(Bill Fred John Tom Susan Jill Jane)
cull = 4
puts "Running simulation for #{names} with a culling at #{cull}..."
winner = HotPotatoSimulator.new(names, cull).run
puts "The winner was #{winner}"

names = %w(Bill Fred John Tom Susan Jill Jane)
cull = 2
puts "Running simulation for #{names} with a culling at #{cull}..."
winner = HotPotatoSimulator.new(names, cull).run
puts "The winner was #{winner}"
