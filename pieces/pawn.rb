require_relative 'piece'

class Pawn < Piece
  def symbol 
    color == 'black' ? '♟' : '♙'
  end

  def move_dirs
  end

  private 

  def at_start_row?
    pos[0] == (color == 'black') ? 6 : 1
  end
  
  def forward_dir
    color == 'black' ? -1 : 1
  end

  def forward_steps
    curr_x, curr_y = pos
    steps = []
    step = [curr_x + forward_dir, curr_y]

    if board.valid(step) && board.empty?(step)
      steps << step
    end

    second_step = [curr_x + 2 * forward_dir]
    steps << second_step if at_start_row? && board.empty(second_step) && board.valid(second_step)

    steps

  end

  def side_attacks
  end
end