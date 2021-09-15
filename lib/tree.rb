# frozen_string_literal: true

class Tree
  attr_accessor :root

  def initialize(starting_coords)
    @root = insert(nil, starting_coords)
  end

  def insert(parent_node, coords)
    node = Node.new(coords)
    parent_node.nil? ? node : parent_node.next_moves << node
  end
end
