module Slideable
  HORIZONTAL_VERTICAL_DIR = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  DIAGONAL_DIR = [
    [1, -1],
    [1, 1],
    [-1, -1],
    [-1, 1]
  ]

  def horizontal_vertical_dir
    HORIZONTAL_VERTICAL_DIR
  end

  def diagonal_dir
    DIAGONAL_DIR
  end

  def moves
    slide_moves = []

    move_dirs.each do |dx, dy|
      slide_moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end
    slide_moves
  end

  private 

  def move_dirs
    #overwritten by subclass
    raise NoImplementedError 
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    cur_x, cur_y = pos
    moves = []

    loop do
      cur_x += dx
      cur_y += dy
      pos = [cur_x, cur_y]

      break unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      else
        moves << pos if board[pos].color != color
        break
      end
    end
    moves
  end


end