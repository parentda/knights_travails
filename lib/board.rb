# frozen_string_literal: true

class Board
  attr_accessor :positions
  attr_reader :size

  def initialize(size)
    @size = size
    @positions = Array.new(@size) { Array.new(@size, 0) }
  end

  def display
    @positions.each_with_index { |row, index| puts "#{index}: #{row}" }
  end
end
