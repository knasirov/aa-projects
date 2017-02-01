require_relative 'board'
require_relative 'player'
require_relative 'display'
require 'byebug'
class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @cursor = @display.cursor
    @player1 = Player.new("Steve", @cursor, "w", @display)
    @player2 = Player.new("John", @cursor, "b", @display)
    @current_player = @player1

  end

  def play

    # Player.get_move returns a valid array of [start_pos, end_pos]
    # We use these positions to update our board, by moving the piece
    # located at start_pos to end_pos. After we do so, switch players

    # until checkmate, take_turn which just calls player.get_move, then
    # another helper method, switch players, which just updates current_player
    # byebug
    until @board.checkmate?(@current_player.color)
      @display.render
      start_pos, end_pos = @current_player.get_move
      @board.move_piece(start_pos, end_pos)
      switch_players
    end

  end

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

end


if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
