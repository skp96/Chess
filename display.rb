require 'colorize'
require_relative 'cursor'

class Display 
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system('clear')
    puts 'Arrow keys, WASD, or vim to move, and space and enter to confirm move.'
  end

  private

end