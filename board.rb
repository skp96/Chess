require_relative 'pieces'

class Board
  attr_reader :rows

  def initialize
    @sentinel = NullPiece.instance
    start_board
  end

  def [](pos)
    raise 'Invalid position' unless valid_pos?(pos)

    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    raise 'Invalid position' unless valid_pos?(pos)

    row, col = pos
    @rows[row][col] = piece
  end

  def move_piece(color, start_pos, end_pos)
    raise 'Start position is empty' if empty?(start_pos)
    
    piece = self[start_pos]

    raise "Don't try to cheat! Move your own piece." if color != piece.color
    raise "The piece does not move like that, please try again." if !piece.moves.include?(end_pos)

    move_piece!(color, start_pos, end_pos)
    
  end

  def move_piece!(color, start_pos, end_pos)
    piece = self[start_pos]

    self[start_pos] = sentinel
    self[end_pos] = piece
    piece.pos = end_pos

    nil
  end

  def valid_pos?(pos)
    pos.all? {|coordinate| coordinate.between?(0, 7)}
  end

  def add_piece(piece, pos)
    raise 'Position is not empty' unless empty?(pos)

    self[pos] = piece
  end

  def empty?(pos)
    piece = self[pos]

    if piece.class.name === 'NullPiece'
      return true
    else
      false
    end
  end

  private

  attr_reader :sentinel

  def start_board
    @rows = Array.new(8) {Array.new(8, sentinel)}
    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]


    rows.each_with_index do |row, row_idx|
      if row_idx == 0 
        8.times do |col_idx|
          piece = back_row[col_idx]
          piece.new('white', self, [row_idx, col_idx])
        end
      elsif row_idx == 1
        8.times {|col_idx| Pawn.new('white', self, [row_idx, col_idx])}
      end  

      if row_idx == 7 
        8.times do |col_idx|
          piece = back_row[col_idx]
          piece.new(:black, self, [row_idx, col_idx])
        end
      elsif row_idx == 6
        8.times {|col_idx| Pawn.new('black', self, [row_idx, col_idx])}
      end  
    end
  end
  
  
end