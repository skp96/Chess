require_relative 'piece'

class Pawn < Piece
  def symbol 
    color == 'black' ? '♟' : '♙'
  end

  def moves
    forward_steps + side_attacks
  end

  private 
  
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
    at_start_row = pos[0] == (color == 'black') ? 6 : 1

    steps << second_step if at_start_row && board.empty?(second_step)

    steps

  end

  def side_attacks
    attacks = []
    curr_x, curr_y = pos
    side_moves = [[curr_x + forward_dir, curr_y - 1], [curr_x + forward_dir, curr_y + 1]]

    side_moves.each do |new_move|
      next false if !board.valid_pos?(new_move)
      next false if board.empty?(new_move)
      attacks << new_move if board[new_move].color != color
    end
    attacks
  end
end