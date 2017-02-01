require_relative 'display'

class Player

  attr_reader :name, :color, :cursor, :display

  def initialize(name, cursor, color, display)
    @name = name
    @cursor = cursor
    @color = color
    @display = display
  end

  def get_move
    inputs = []

    while inputs.length < 2
      @display.render
      new_pos = self.cursor.get_input
      if new_pos.is_a?(Array)
        move_pos = new_pos
        inputs << move_pos
      end
    end

    start_pos, end_pos = inputs
    piece = @cursor.board.get_piece(start_pos)
    raise ArgumentError.new if piece.color != @color
    raise ArgumentError.new unless piece.valid_moves.include?(end_pos)

    inputs

  rescue ArgumentError => e
    puts "Invalid move: please try again"
    retry
  end

end
