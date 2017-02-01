require_relative 'sliding_piece'
require_relative 'piece'


class Queen < Piece
  include SlidingPiece

  def initialize(board, symbol, color, pos)
    super
  end

  def all_moves
    non_diagonal_moves(@pos) + diagonal_moves(@pos)
  end

  def dup
    self.class.new(@board, @symbol, @color, @pos)
  end


end
