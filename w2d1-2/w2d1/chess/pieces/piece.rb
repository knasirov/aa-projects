class Piece

  attr_accessor :symbol, :color, :board, :pos

  def initialize(board, symbol, color, pos)
    @board = board
    @symbol = symbol
    @color = color
    @pos = pos
  end

  def valid_moves
    # generate all possible next-board positions, allowing any of
    # color's pieces to move to any valid pos, if king is still in check
    # return true for checkmate else false
    moves = []

    self.all_moves.each do |move|
      copy = Board.deep_dup(@board)
      copy.move_piece(@pos, move)
      moves << move unless copy.in_check?(@color)
    end

    moves
  end


end

#method = self.class.superclass.instance_method(:all_moves)
#method.call =>  self.class.superclass.instance_method(:all_moves)()
