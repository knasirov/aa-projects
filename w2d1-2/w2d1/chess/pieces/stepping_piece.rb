module SteppingPiece

  def moves(position, deltas)
    row, col = position
    positions = []


    deltas.each do |del|
      new_pos = [row + del[0], col + del[1]]
      next unless new_pos.all? { |pos| pos.between?(0, 7) }
      adj_piece = self.board[new_pos]
      positions << new_pos if adj_piece.color != self.color
    end

    positions
  end

end
