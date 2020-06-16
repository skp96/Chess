
class Piece
  attr_reader :board, :color
  attr_accessor :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

    board.add_piece(self, pos)
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    false
  end

  def valid_moves
    moves.reject {|move| move_into_check?(move)}
  end

  private

  def move_into_check?(end_pos)
    copy_board = board.dup
    copy_board.move_piece!(color, pos, end_pos)
    copy_board.in_check?(color)
  end


end
