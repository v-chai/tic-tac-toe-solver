require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    current_node = TicTacToeNode.new(game.board, mark)
    current_node.children.each do |child_node|
      if child_node.winning_node?(mark)
        return child_node.prev_move_pos
      end
    end

    current_node.children.each do |child_node|
      if !child_node.losing_node?(mark)
        return child_node.prev_move_pos
      end
    end 

    raise "No possible winning moves to make"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
