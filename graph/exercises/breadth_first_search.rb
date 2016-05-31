require_relative '../../basic_data_structures/queue.rb'
require_relative '../adjacency_list.rb'

class Vertex
  attr_accessor :color
end

class BreadthFirstSearch

  def self.traverse(graph, start_vertex)
    queue = Queue.new
    queue.enqueue(start_vertex)

    puts " Inspecting: #{start_vertex.key}"

    while queue.size > 0
      current_vertex = queue.dequeue

      current_vertex.connections.each do |neighbor|
        neighbor.color = "white" unless  neighbor.color

        if neighbor.color == "white"
          puts " Inspecting: #{neighbor.key}"

          neighbor.color = "gray"
          queue.enqueue(neighbor)
        end
      end
      current_vertex.color = "black"
    end
  end

end

puts "Create a graph"

al = AdjacencyList.new

start = al.add_vertex(0)

(1...6).to_a.each do |key|
  al.add_vertex(key)
end

al.add_edge(0,1,5)
al.add_edge(0,5,2)
al.add_edge(1,2,4)
al.add_edge(2,3,9)
al.add_edge(3,4,7)
al.add_edge(3,5,3)
al.add_edge(4,0,1)
al.add_edge(5,4,8)
al.add_edge(5,2,1)

puts "Show Available Keys:"
puts " #{al.vertices}"

puts "Traverse using breadth first search"

BreadthFirstSearch.traverse(al, start)
