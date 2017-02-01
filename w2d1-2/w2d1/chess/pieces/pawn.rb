require_relative 'piece'
require 'byebug'
class Pawn < Piece

  def initialize(board, symbol, color, pos)
    super
  end

  # all_moves for Pawn is only its eating moves, not actualyl all moves
  def all_lethal_moves
    x, y = @pos
    # if black can move down only until blocked by either side, can move diagonal
    # down if pos occupied by enemy color (down/up inverted for white)
    positions = []
    step = (self.color == "b" ? 1 : -1)
    opp_color = (self.color == "b" ? "w" : "b")

    [[x - 1, y + step], [x + 1, y + step]].each do |new_pos|
      positions << new_pos if new_pos.all? { |p| p.between?(0, 7) } &&
                              @board[new_pos].color == opp_color
    end

    # missing en passant; too complicated, would have to set property
    # did_double_step (init false), if true enable it to have the
    # added en_passant move
    positions
  end

  def all_non_lethal_moves
    x, y = @pos
    positions = []

    step = (self.color == "b" ? 1 : -1)
    start_row = (self.color == "b" ? 1 : 6)

    # add the vertical space if that space diff color
    # byebug

    positions << [x, y + step] if (y + step).between?(0, 7) && @board[[x, y + step]].color == "n"
    positions << [x, y + step * 2] if (y + step * 2).between?(0, 7) &&
                                      @board[[x, y + step]].color == "n" &&
                                      @board[[x, y + step * 2]].color  == "n "&&
                                      x == start_row
    positions
  end

  # def valid_moves
  #   p @pos
  #   all_non_lethal_moves(@pos) + super
  # end

  def all_moves
    moves = []

    self.all_lethal_moves.each do |move|
      copy = Board.deep_dup(@board)
      copy.move_piece(@pos, move)
      moves << move unless copy.in_check?(@color)
    end

    self.all_non_lethal_moves.each do |move|
      copy = Board.deep_dup(@board)
      copy.move_piece(@pos, move)
      moves << move unless copy.in_check?(@color)
    end

    moves
  end

  def dup
    self.class.new(@board, @symbol, @color, @pos)
  end


end
