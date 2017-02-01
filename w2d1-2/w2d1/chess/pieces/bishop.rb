require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece

  def initialize(board, symbol, color, pos)
    super
  end


  def all_moves
    diagonal_moves(@pos)
  end

  def dup
    self.class.new(@board, @symbol, @color, @pos)
  end

end
