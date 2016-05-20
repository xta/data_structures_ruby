require_relative '../adjacency_matrix.rb'

# output helper

def display_internal_state(am)
  p am.instance_variable_get(:@graph)
end

# AdjacencyMatrix usage

puts "Create Adjacency Matrix"

am = AdjacencyMatrix.new

puts "Add vertices..."

am.add_vertex("a")
am.add_vertex("b")
am.add_vertex("c")

puts "Check width & height"

puts " #{am.graph.width}"
puts " #{am.graph.height}"

puts "Add non-weighted edge..."
am.add_edge("a", "b", 1)

puts "Check value at edge: "
puts am.edge_from_vertices("a", "b")

puts "Add weighted edge..."
am.add_weighted_edge("a", "c", 1, 3)

puts "Check value at weighted edge: "
puts am.edge_from_vertices("a", "c")

# note: this method #vertex_index_from_key may not be needed or useful
puts "Get vertex position from vertex name/key"
puts am.vertex_index_from_key("a")
