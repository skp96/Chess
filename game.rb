require_relative 'board'
require_relative 'human_player'

class Game
  attr_reader :board, :display, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      'black' => HumanPlayer.new('black', @display),
      'white' => HumanPlayer.new('white', @display)
    }
    @current_player = 'black'
  end

  def play
    until board.checkmate?(current_player)
      start_pos, end_pos = players[current_player].make_move(board)
      board.move_piece(current_player, start_pos, end_pos)
      swap_turns!
      notify_players
    end

    display.render
    puts "Checkmate #{current_player.capitalize}"

    nil
  end

  private

  def notify_players
    if board.in_check?(current_player)
      puts "Check"
    end
  end

  def swap_turns!
    @current_player = current_player == 'black' ? 'white' : 'black'
  end
end

if $PROGRAM_NAME == __FILE__
  Game.new.play
end