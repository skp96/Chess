require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def symbol
    color == 'black' ? '♜' : '♖'
  end

  protected 
  
  def move_dirs
    HORIZONTAL_VERTICAL_DIR
  end

end