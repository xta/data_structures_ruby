class AdjacencyList

  def initialize
    @vertices = {}
  end

  def add_vertex(key)
    new_vertex = Vertex.new(key)
    @vertices[key] = new_vertex
    new_vertex
  end

  def vertex(key)
    @vertices[key]
  end

  def add_edge(from_vertex, to_vertex, cost=0)
    add_vertex(from_vertex) unless vertices.include?(from_vertex)
    add_vertex(to_vertex) unless vertices.include?(to_vertex)

    vertex(from_vertex).add_neighbor(vertex(to_vertex), cost)
  end

  def vertices
    @vertices.keys
  end

end

class Vertex

  attr_reader :key

  def initialize(key)
    @key = key
    @connected_to = {}
  end

  def add_neighbor(neighbor, weight=0)
    @connected_to[neighbor] = weight
  end

  def connections
    @connected_to.keys
  end

  def weight_for_neighbor(neighbor)
    @connected_to[neighbor]
  end

end
