# frozen_string_literal: true

class Board
  attr_accessor :positions

  def initialize
    @positions = Array.new(8, 0) { Array.new(8, 0) }
  end
end
