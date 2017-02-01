require_relative 'tic_tac_toe'

class TicTacToeNode

  ALL_POS = [ [0, 0], [0, 1], [0, 2],
              [1, 0], [1, 1], [1, 2],
              [2, 0], [2, 1], [2, 2] ]

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_pos = ALL_POS.select(&:epmty?)
    empty_pos.each do|pos|
      board_copy = @board.dup
      board_copy[pos] = next_mover_mark
    end

  end
end
