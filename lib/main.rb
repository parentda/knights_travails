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

  path = generate_moves(starting_position, ending_position, board, moves_tree)
  display_path(path)
end

def generate_moves(starting_position, ending_position, board, tree)
  queue = [] << starting_position
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

def display_path(array)
  puts 'The shortest path is:'
  array.each { |pair| p pair }
end
