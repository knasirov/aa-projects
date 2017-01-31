require_relative "00_tree_node.rb"

class KnightPathFinder

  DELTAS = [  [1, 2],
              [-1, 2,],
              [1, -2,],
              [-1, -2,],
              [2, 1,],
              [-2, 1,],
              [2, -1,],
              [-2, -1,]  ]

  attr_reader :knight, :visited_positions, :tree

  def initialize(value=[0, 0])
    @knight = PolyTreeNode.new(value)
    @visited_positions = [value]
    @tree = [@knight]
    build_move_tree
  end

  def self.valid_moves(pos)
    possible_pos = DELTAS.map do |delta|
      [delta, pos].transpose.map { |a| a.inject(&:+) }
    end

    possible_pos.select do |posi|
      posi.all? { |coord| coord.between?(0, 7) }
    end
  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos).select do |pos|
      !@visited_positions.include?(pos)
    end

    @visited_positions.concat(new_pos)
    new_pos
  end

  def build_move_tree
    new_nodes = [@knight]
    until new_nodes.empty?
      parent = new_nodes.shift
      new_pos = new_move_positions(parent.value)
      new_pos.each do |pos|
        new_node = PolyTreeNode.new(pos)
        @tree << new_node
        parent.add_child(new_node)
        new_nodes << new_node
      end
    end
  end

  def find_path(end_pos)
    end_node = nil
    @tree.each { |node| end_node = node if node.value == end_pos }
    trace_path_back(end_node)
  end

  def trace_path_back(node)
    result = [node.value]
    until node.parent.nil?
      node = node.parent
      result << node.value
    end
    result.reverse
  end
end

if __FILE__ == $PROGRAM_NAME
  a = KnightPathFinder.new
  p a.find_path([6, 2])
end
