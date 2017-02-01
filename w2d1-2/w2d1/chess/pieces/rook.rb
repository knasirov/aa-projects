require_relative 'sliding_piece'
require_relative 'piece'


class Rook < Piece
  include SlidingPiece

  def initialize(board, symbol, color, pos)
    super
  end

  def all_moves
    non_diagonal_moves(@pos)
  end

  def dup
    self.class.new(@board, @symbol, @color, @pos)
  end

end


# load '../board.rb'
# b = Board.new
# load 'rook.rb'
# r = Rook.new(b, "w", [4, 4])
# r.all_moves([4, 4])
