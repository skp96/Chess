require_relative 'player'
require_relative 'display'


class HumanPlayer  < Player

  def make_move(_board)
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      display.render

      if start_pos
        puts "#{color.capitalize}'s turn. Please select where you would like to move to.'"
        end_pos = display.cursor.get_input
      else
        puts "#{color.capitalize}'s turn. Please select a piece you would like to move'"
        start_pos = display.cursor.get_input
      end

    end
    [start_pos, end_pos]
  end
end