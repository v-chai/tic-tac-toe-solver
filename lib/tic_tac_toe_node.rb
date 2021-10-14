require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board
  attr_accessor :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def empty_spots(board)
    empties = []
    (0..2).each do |row|
      (0..2).each do |col| 
        empties << [row,col] if @board.empty?([row,col])
      end
    end
    empties
  end
  
  def children
    child_nodes = []
    empty_spots(@board).each do |loc|
      child = TicTacToeNode.new(@board.dup, @next_mover_mark, @prev_move_pos)
      child.board[loc] = child.next_mover_mark
      child_nodes << child
      if @next_mover_mark == :x
        child.next_mover_mark = :o
      else 
        child.next_mover_mark = :x
      end
      child.prev_move_pos = loc
    end
    child_nodes
  end
end
