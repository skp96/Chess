require 'colorize'
require_relative 'cursor'

class Display 
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([7,0], board)
  end

  def render
    system('clear')
    puts 'Arrow keys, WASD, or vim to move, and space and enter to confirm move.'
    color_grid.each.with_index {|row, idx| puts "#{idx+1} #{row.join}"}
    puts "   A  B  C  D  E  F  G  H"
  end

  private

  def color_grid
    @board.rows.map.with_index do |row, i|
      color_row(row, i)
    end
  end

  def color_row(row, i)
    row.map.with_index do |piece, j|
      color_options = get_color(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def get_color(row, col)
    if cursor.cursor_pos == [row, col] && cursor.selected
      color = :light_yellow
    elsif cursor.cursor_pos == [row, col]
      color = :blue
    elsif (row + col).even?
      color = :black
    else
      color = :red
    end
    {background: color}
  end
end