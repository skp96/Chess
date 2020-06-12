require_relative 'piece'

class Pawn < Piece
  def symbol 
    color == 'black' ? '♟' : '♙'
  end

  def move_dirs
  end

  private 

  def at_start_row?
  end
  
  def forward_dir
    color == 'black' ? 1 : -1
  end

  def forward_steps
  end

  def side_attacks
  end
end