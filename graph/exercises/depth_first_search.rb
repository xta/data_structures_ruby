require_relative '../adjacency_list.rb'

class Vertex
  attr_accessor :color, :predecessor, :discovery_time, :finish_time
end

class AdjacencyList
  def nodes
    @vertices.values
  end
end

class DepthFirstSearch

  attr_reader :time

  UNVISITED_KEY = "white".freeze
  VISITED_KEY   = "gray".freeze
  COMPLETED_KEY = "black".freeze

  def initialize(graph)
    @graph = graph
    @time = 0
    @debug = nil
  end

  def traverse(&debug)
    @debug = debug if block_given?

    @graph.nodes.each do |node|
      node.color = UNVISITED_KEY
      node.predecessor = -1
    end

    @graph.nodes.each do |node|
      if node.color == UNVISITED_KEY
        visit(node)
      end
    end
  end

  private

  def visit(start_node)
    @debug.call(start_node) if @debug

    start_node.color = VISITED_KEY
    @time += 1
    start_node.discovery_time = Time.now

    start_node.connections.each do |connection|
      if connection.color == UNVISITED_KEY
        connection.predecessor = start_node
        visit(connection)
      end
    end

    start_node.color = COMPLETED_KEY
    @time += 1

    start_node.finish_time = Time.now
  end

end

puts "Create a graph"

graph = AdjacencyList.new

start = graph.add_vertex(0)

(1...6).to_a.each do |key|
  graph.add_vertex(key)
end

graph.add_edge(0,1,5)
graph.add_edge(0,5,2)
graph.add_edge(1,2,4)
graph.add_edge(2,3,9)
graph.add_edge(3,4,7)
graph.add_edge(3,5,3)
graph.add_edge(4,0,1)
graph.add_edge(5,4,8)
graph.add_edge(5,2,1)

puts "Show Available Keys:"
puts " #{graph.vertices}"

puts "Traverse using depth first search"

dfs = DepthFirstSearch.new(graph)
dfs.traverse { |node| puts " visiting #{node.key}" }

puts "Check the time"
puts " #{dfs.time}"
