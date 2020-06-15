require 'colorize'
require_relative 'cursor'

class Display 
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system('clear')
    puts 'Arrow keys, WASD, or vim to move, and space and enter to confirm move.'
    color_grid.each {|row| puts row.join}
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
      color = :light_red
    elsif (row + col).even?
      color = :white
    else
      color = :light_blue
    end
    {background: color}
  end
end