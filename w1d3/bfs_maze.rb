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
    @current_tiles = [@start_pos]
    @all_seen_tiles = { @start_pos => nil }
    until @current_tiles.include?(@end_pos)
      explore_current_tiles
    end
    solution = build_path

    # stringifying solution
    solution.each do |pos|
      row, col = pos
      @board[row][col] = "X" if @board[row][col] == " "
    end
  end

  def explore_current_tiles
    new_current_tiles = []
    @current_tiles.each do |tile|
      find_valid_moves(tile).each do |neighbor|
        unless @all_seen_tiles.key?(neighbor)
          new_current_tiles << neighbor
          @all_seen_tiles[neighbor] = tile
        end
      end
    end
    @current_tiles = new_current_tiles
  end

  def build_path
    next_tile = @end_pos
    path = [@end_pos]
    while @all_seen_tiles[next_tile]
      path << @all_seen_tiles[next_tile]
      next_tile = @all_seen_tiles[next_tile]
    end
    path
  end

end

if __FILE__ == $0
  m = Maze.new('maze1.txt')
  puts m.render
  m.run
  puts m.render
end
