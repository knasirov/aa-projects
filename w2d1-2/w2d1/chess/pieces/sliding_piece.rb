module SlidingPiece

  def non_diagonal_moves(pos)
    find_non_diagonal(pos, "h", true) +
    find_non_diagonal(pos, "h", false) +
    find_non_diagonal(pos, "v", true) +
    find_non_diagonal(pos, "v", false)
  end

  def diagonal_moves(pos)
    find_diagonal(pos, true, true) +
    find_diagonal(pos, true, false) +
    find_diagonal(pos, false, true) +
    find_diagonal(pos, false, false)
  end

  private

  def find_non_diagonal(pos, h_or_v, forward)
    x, y = pos

    # by default, we are capturing the ["v", false] case
    moving_dir, multiplier = y, -1

    case [h_or_v, forward]
    when ["h", true]
      moving_dir, multiplier = x, 1
    when ["h", false]
      moving_dir, multiplier = x, -1
    when ["v", true]
      moving_dir, multiplier = y, 1
    end

    con_pos = (moving_dir == x) ? y : x

    positions = []

    moving_dir += 1 * multiplier

    while moving_dir.between?(0, 7)
      pot_pos = (h_or_v == "h") ? [moving_dir, con_pos] : [con_pos, moving_dir]
      p pot_pos
      piece = self.board[pot_pos]

      if piece.is_a?(NullPiece)
        positions << pot_pos
      elsif piece.color == self.color
        break
      else
        positions << pot_pos
        break
      end
      moving_dir += 1 * multiplier
    end

    positions
  end

  def find_diagonal(pos, x_inc, y_inc)
    x, y = pos

    # by default, we are capturing the ["v", false] case
    x_step, y_step = -1, -1

    case [x_inc, y_inc]
    when [true, true]
      x_step, y_step = 1, 1
    when [true, false]
      x_step, y_step = 1, -1
    when [false, true]
      x_step, y_step = -1, 1
    end

    positions = []

    pot_pos = [x + x_step, y + y_step]
    while pot_pos.all? { |pst| pst.between?(0, 7) }
      piece = self.board[pot_pos]

      if piece.is_a?(NullPiece)
        positions << pot_pos
      elsif piece.color == self.color
        break
      else
        positions << pot_pos
        break
      end
      pot_pos = [pot_pos[0] + x_step, pot_pos[1] + y_step]
    end

    positions
  end
end
