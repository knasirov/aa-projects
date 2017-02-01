require_relative 'cursor'
require_relative 'board'
require 'byebug'
require 'colorize'
class Display

  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    # render
  end


  def render
    system("clear")
    labels = (0..7).to_a
    print " "
    labels.each { |label| print "   #{label}"}
    puts
    labels.each do |label|
      puts
      print "#{label}"
      @cursor.board.grid[label].each { |el| print "   #{el.symbol}"}
      puts
    end
  end


end

# if __FILE__ == $PROGRAM_NAME
#   d = Display.new
#   # byebug
#   d.render
#   d.cursor.get_input
#   d.render
#   d.cursor.get_input
#   d.render
#   d.cursor.get_input
#   d.render
#   d.cursor.update_pos([1, 1])
# end
