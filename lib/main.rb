# frozen_string_literal: true

require_relative 'tree'
require_relative 'node'
require_relative 'board'
require_relative 'knight'

def knight_moves(starting_position, ending_position)
  @board = Board.new
  @moves_tree = Tree.new(starting_position)
  return [starting_position] if starting_position == ending_position

  @board.positions[starting_position[0]][starting_position[1]] = 1
  queue = [] << starting_position

  until queue.empty?
    curr_move = queue.shift

    Knight.moves.each do |shift|
      next_move = [curr_move, shift].transpose.map(&:sum)

      unless next_move[0].between?(0, @board.positions.size - 1) &&
               next_move[1].between?(0, @board.positions.size - 1) &&
               @board.positions[next_move[0]][next_move[1]].zero?
        next
      end

      @board.positions[next_move[0]][next_move[1]] = 1
      @moves_tree.insert(next_move, curr_move)
      return @moves_tree.backtrack(next_move) if next_move == ending_position

      queue << next_move
    end
  end
end
