require_relative 'piece'

class Pawn < Piece
  def symbol 
    color == 'black' ? '♟' : '♙'
  end

  def moves
    forward_steps + side_attacks
  end

  private 

  def at_start_row?
    pos[0] == (color == 'black') ? 6 : 1
  end
  
  def forward_dir
    color == 'black' ? -1 : 1
  end

  def forward_steps
    steps = []
    curr_x, curr_y = pos
    step = [curr_x + forward_dir, curr_y]

    if board.valid_pos?(step) && board.empty?(step)
      steps << step
    end

    second_step = [(forward_dir * 2) + curr_x, curr_y]
    steps << second_step if at_start_row? && board.empty?(second_step) && board.valid_pos?(second_step)

    steps

  end

  def side_attacks
    attacks = []
    curr_x, curr_y = pos
    side_attack_dirs = [[forward_dir, -1], [forward_dir, 1]]

    side_attack_dirs.each do |dx, dy|
      new_pos = [curr_x + dx, curr_y + dy]
      attacks << pos if board.valid_pos?(new_pos) && !board.empty?(new_pos) && board[new_pos].color != color
    end
    attacks
  end
end