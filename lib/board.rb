# frozen_string_literal: true

class Board
  attr_accessor :positions

  def initialize
    @positions = Array.new(8) { Array.new(8, 0) }
  end

  def display
    @positions.each_with_index { |row, index| puts "#{index}: #{row}" }
  end
end
