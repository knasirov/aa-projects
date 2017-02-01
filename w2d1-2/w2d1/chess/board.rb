require_relative 'pieces/piece'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require_relative 'pieces/pawn'
require_relative 'pieces/null_piece'
require 'colorize'
require 'byebug'

class Board

  attr_accessor :grid

  def self.deep_dup(board)
    cloned = Board.new

    board.grid.each.with_index do |row, i|
      row.each.with_index do |piece, j|
        cloned.grid[i][j] = board.grid[i][j].dup
      end
    end

    cloned
  end


  def initialize
    @grid = Array.new(8) { Array.new(8)}
    populate
  end

  def populate
    @grid.each_with_index do |row, ridx|
      row.each_index do |cidx|
        if ridx == 0
          # hard code black non-pawns
          case
          when cidx == 0 || cidx == 7
            @grid[ridx][cidx] = Rook.new(self, "r", "b", [ridx, cidx])
          when cidx == 1 || cidx == 6
            @grid[ridx][cidx] = Knight.new(self, "k", "b", [ridx, cidx])
          when cidx == 2 || cidx == 5
            @grid[ridx][cidx] = Bishop.new(self, "b", "b", [ridx, cidx])
          when cidx == 3
            @grid[ridx][cidx] = Queen.new(self, "Q", "b", [ridx, cidx])
          when cidx == 4
            @grid[ridx][cidx] = King.new(self, "K", "b", [ridx, cidx])
          end
        elsif ridx == 1
          # black pawns
          @grid[ridx][cidx] = Pawn.new(self, "p", "b", [ridx, cidx])
        elsif ridx == 6
          # white pawns
          @grid[ridx][cidx] = Pawn.new(self, "p".red, "w", [ridx, cidx])
        elsif ridx == 7
        #  hard code white non-pawns
         case
         when cidx == 0 || cidx == 7
           @grid[ridx][cidx] = Rook.new(self, "r".red, "w", [ridx, cidx])
         when cidx == 1 || cidx == 6
           @grid[ridx][cidx] = Knight.new(self, "k".red, "w", [ridx, cidx])
         when cidx == 2 || cidx == 5
           @grid[ridx][cidx] = Bishop.new(self, "b".red, "w", [ridx, cidx])
         when cidx == 3
           @grid[ridx][cidx] = Queen.new(self, "Q".red, "w", [ridx, cidx])
         when cidx == 4
           @grid[ridx][cidx] = King.new(self, "K".red, "w", [ridx, cidx])
         end
        else
          @grid[ridx][cidx] = NullPiece.new(self, " ", "n", [ridx, cidx])
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
  # updates board at end_pos to hold the moved piece, updates old_pos to NullPiece
  self[end_pos], self[start_pos] = get_piece(start_pos), NullPiece.new(self, " ", "n", end_pos)
  # update moved_piece's pos
  get_piece(end_pos).pos = end_pos
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def [](pos)
    # debugger
    row, col = pos
    @grid[row][col]
  end

  def get_piece(pos)
    self[pos]
  end


  def in_bounds(pos)
    pos.all? { |pst| pst.between?(0, 7) }
  end


  def in_check?(color)
    # see if any of opponents pieces has the opposite king's pos in
    # their available moves
    king_pos = nil
    opp_color = color == "b" ? "w" : "b"
    opp_pieces = []
    # byebug
    @grid.each.with_index do |row, i|
      row.each.with_index do |piece, j|
        opp_pieces << piece if piece.color == opp_color
        king_pos = [i, j] if piece.color == color && piece.is_a?(King)
      end
    end

    opp_pieces.each { |piec| return true if piec.all_moves.include?(king_pos) }

    false
  end

  def checkmate?(color)
    # generate all possible next-board positions, allowing any of
    # color's pieces to move to any valid pos, if king is still in check
    # return true for checkmate else false
    pieces = []

    @grid.each.with_index do |row, i|
      row.each.with_index do |piece, j|
        pieces << piece if piece.color == color
      end
    end

    pieces.all? { |piec| piec.valid_moves.empty? }
  end



end
