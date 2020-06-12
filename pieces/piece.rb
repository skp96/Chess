
class Piece
  attr_reader :board, :color
  attr_accessor :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

    board.add_piece(self, pos)
  end


end
