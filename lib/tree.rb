# frozen_string_literal: true

class Tree
  attr_accessor :nodes

  def initialize(starting_coords)
    @moves = {}
    insert(starting_coords)
  end

  def insert(coords, parent_coords = nil)
    @moves[coords] = { parent: parent_coords, children: [] }
    @moves[parent_coords][:children] << coords if parent_coords
  end

  def backtrack(coords)
    path = []
    until coords.nil?
      path << coords
      coords = @moves[coords][:parent]
    end
    path.reverse
  end
end
