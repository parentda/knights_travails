# frozen_string_literal: true

require_relative 'tree'
require_relative 'board'
require_relative 'knight'

def knight_moves(starting_position, ending_position)
  return [starting_position] if starting_position == ending_position

  board = Board.new(8)
  unless board.valid_position?(starting_position) &&
           board.valid_position?(ending_position)
    return puts 'Invalid coordinates'
  end

  moves_tree = Tree.new(starting_position)
  board.visited(starting_position)
  queue = [] << starting_position

  generate_moves(ending_position, board, moves_tree, queue)
end

def generate_moves(ending_position, board, tree, queue)
  until queue.empty?
    curr_move = queue.shift

    Knight.moves.each do |shift|
      next_move = [curr_move, shift].transpose.map(&:sum)
      next unless board.valid_position?(next_move)

      board.visited(next_move)
      tree.insert(next_move, curr_move)
      return tree.backtrack(next_move) if next_move == ending_position

      queue << next_move
    end
  end
end
