# Adjacency Matrix is a way to implement a graph using a 2D matrix.

# Each row & column represents a vertex (node) in the graph.
# The value that is stored in the intersection of the row & column indicates an edge (arc) that connects the vertices.
# When two vertices are connected by an edge, they are adjacent.

class AdjacencyMatrix

  attr_reader :graph

  def initialize
    @graph = Matrix.new
    @vertices = []
  end

  def add_vertex(vertex)
    return false if in?(vertex)

    @vertices << vertex
    @graph.increment_size
    true
  end

  def add_edge(from_vertex, to_vertex, value)
    add_weighted_edge(from_vertex, to_vertex, value, nil)
  end

  def add_weighted_edge(from_vertex, to_vertex, value, weight)
    from_index = @vertices.index(from_vertex)
    to_index = @vertices.index(to_vertex)
    @graph.set_cell_value(from_index, to_index, value, weight)
  end

  def edge_from_vertices(from_vertex, to_vertex)
    from_index = @vertices.index(from_vertex)
    to_index = @vertices.index(to_vertex)
    @graph.cell_value(from_index, to_index)
  end

  def vertex_index_from_key(key)
    return unless in?(key)
    @vertices.index(key)
  end

  def in?(vertex)
    @vertices.include?(vertex)
  end

end

Cell = Struct.new(:value, :weight)

class Matrix

  def initialize
    @cells = []
  end

  def set_cell_value(x, y, value, weight=nil)
    @cells[x][y] = Cell.new(value, weight)
  end

  def cell_value(x, y)
    @cells[x][y]
  end

  def width
    @cells.count
  end

  def height
    return 0 if @cells.count == 0
    @cells.first.count
  end

  def increment_size
    if @cells.size == 0
      @cells = [[Cell.new]]
    else
      initial_size = @cells.first.size
      @cells << Array.new(initial_size, Cell.new)
      @cells.each { |array| array << Cell.new }
    end
  end

end
