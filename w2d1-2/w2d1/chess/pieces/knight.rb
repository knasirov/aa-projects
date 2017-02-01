require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  def initialize(board, symbol, color, pos)
    super
  end

  DELTAS = [ [-1, -2], [-1, 2], [1, -2], [1, 2], [2, 1], [2, -1], [-2, -1], [-2, 1] ]

  def all_moves
    moves(@pos, DELTAS)
  end

  def dup
    self.class.new(@board, @symbol, @color, @pos)
  end


end
