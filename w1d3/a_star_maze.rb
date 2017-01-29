require 'set'

class Maze
  attr_reader :start_pos

  def initialize(filename)
    @board = File.readlines(filename).map { |row| row.chomp.split("") }
    @path = []
    @start_pos = search_map("S")
    @end_pos = search_map("E")
  end

  def render
    @board.map { |row| row.join("") }.join("\n")
  end

  def find_valid_moves(pos)
    row, col = pos
    valid_moves = []
    valid_moves << [row - 1, col] unless @board[row - 1][col] == "*"
    valid_moves << [row + 1, col] unless @board[row + 1][col] == "*"
    valid_moves << [row, col - 1] unless @board[row][col - 1] == "*"
    valid_moves << [row, col + 1] unless @board[row][col + 1] == "*"
    valid_moves
  end

  def search_map(char)
    @board.length.times do |row|
      @board[0].length.times do |col|
        return [row, col] if @board[row][col] == char
      end
    end
  end

  def run
    closed_set = Set.new
    open_set = Set.new([@start_pos])
    @came_from = {}
    g_score = Hash.new { |h, k| h[k] = Float::INFINITY }
    g_score[@start_pos] = 0
    f_score = Hash.new { |h, k| h[k] = Float::INFINITY }
    f_score[@start_pos] = dist_heuristic(@start_pos)

    until open_set.empty?
      current = open_set.min { |pos| dist_heuristic(pos) }
      return build_path if current == @end_pos
      open_set.delete(current)
      closed_set.add(current)
      find_valid_moves(current).each do |neighbor|
        next if closed_set.include?(neighbor)
        tentative_g_score = g_score[current] + 1
        if !open_set.include?(neighbor)
          open_set.add(neighbor)
        elsif tentative_g_score >= g_score[neighbor]
          next
        end
        @came_from[neighbor] = current
        g_score[neighbor] = tentative_g_score
        f_score[neighbor] = g_score[neighbor] + dist_heuristic(neighbor)
      end
    end
    return "no possible path"
  end

  # for finding potential A* path through maze
  def dist_heuristic(pos)
    row, col = pos
    endrow, endcol = @end_pos
    (row - endrow).abs + (col - endcol).abs
  end

  def build_path
    next_tile = @end_pos
    path = [@end_pos]
    while @came_from[next_tile]
      path << @came_from[next_tile]
      next_tile = @came_from[next_tile]
    end

    # stringifying solution
    path.each do |pos|
      row, col = pos
      @board[row][col] = "X" if @board[row][col] == " "
    end
  end

end

if __FILE__ == $0
  m = Maze.new('maze1.txt')
  puts m.render
  m.run
  puts m.render
end
