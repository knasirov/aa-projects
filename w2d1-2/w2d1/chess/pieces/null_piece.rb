require_relative 'piece'
# require 'singleton'

class NullPiece < Piece

  # include Singleton

  def initialize(board, symbol, color, pos)
    super
  end

  def valid_moves
    []
  end

  def all_moves
    []
  end
end
