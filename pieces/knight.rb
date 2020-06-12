require_relative 'piece'
require_relative 'stepable'

class Knight < Piece

  def symbol
    color == 'black' ? '♞' : '♘'
  end

  protected 

  def move_diffs
    
  end

end