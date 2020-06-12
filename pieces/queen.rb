require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol
    color == 'black' ? '♛' : '♕'
  end

  def move_dirs
    HORIZONTAL_VERTICAL_DIR + DIAGONAL_DIR
  end

end