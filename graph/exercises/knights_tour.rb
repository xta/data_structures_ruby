require_relative '../adjacency_list.rb'

class Vertex
  attr_accessor :color
end

class AdjacencyList
  def first_vertex
    @vertices[@vertices.keys.first]
  end
end

class KnightsTour

  def initialize(board_size)
    range = (0...board_size).to_a

    @graph = AdjacencyList.new

    range.each do |row|
      range.each do |column|
        node = position_to_node_id(row, column, board_size)
        new_positions = legal_moves(row, column, board_size)

        new_positions.each do |position|
          new_node = position_to_node_id(position[0], position[1], board_size)
          @graph.add_edge(node, new_node)
        end
      end
    end
  end

  def first_node
    @graph.first_vertex
  end

  def traverse(tree_depth, path, unexplored, limit)
    unexplored.color = "gray"
    path.push unexplored

    if tree_depth < limit
      neighbor_keys = unexplored.connections
      index = 0
      done = false

      while index < neighbor_keys.size and !done
        if neighbor_keys[index].color == "white"
          done = traverse(tree_depth+1, path, neighbor_keys[index], limit)
        end

        index += 1
      end

      if !done
        path.pop
        unexplored.color = "white"
      end

    else
      done = true
    end

    done
  end

  private

  def position_to_node_id(row, column, board_size)
    (row * board_size) + column
  end

  def legal_moves(x, y, board_size)
    new_moves = []
    move_offsets = [[-1,-2],  [-1,2], [-2,-1],  [-2,1],
                    [1,-2],   [1,2],  [2,-1],   [2,1]]
    move_offsets.each do |move_offset|
      new_x = x + move_offset[0]
      new_y = y + move_offset[1]

      if legal_coordinate(new_x, board_size) && legal_coordinate(new_y, board_size)
        new_moves.push([new_x, new_y])
      end
    end

    new_moves
  end

  def legal_coordinate(coord, board_size)
    coord >= 0 && coord < board_size
  end

end

kt = KnightsTour.new(10)

# note: KnightsTour#traverse may not be working properly
p kt.traverse(0, [], kt.first_node, 1_000)
