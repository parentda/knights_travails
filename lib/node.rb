# frozen_string_literal: true

class Node
  attr_accessor :next_moves
  attr_reader :coords

  def initialize(coords)
    @coords = coords
    @next_moves = []
  end
end
