require_relative '../adjacency_list.rb'

puts "Create Adjacency List"
al = AdjacencyList.new

puts "Add vertices"
(0...6).to_a.each do |key|
  al.add_vertex(key)
end

puts "Add edges"
al.add_edge(0,1,5)
al.add_edge(0,5,2)
al.add_edge(1,2,4)
al.add_edge(2,3,9)
al.add_edge(3,4,7)
al.add_edge(3,5,3)
al.add_edge(4,0,1)
al.add_edge(5,4,8)
al.add_edge(5,2,1)

puts "Show vertices"
p al.vertices
