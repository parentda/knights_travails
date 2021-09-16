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

  def valid_position?(coords)
    coords[0].between?(0, @size - 1) && coords[1].between?(0, @size - 1) &&
      @positions[coords[0]][coords[1]].zero?
  end

  def visited(coords)
    @positions[coords[0]][coords[1]] = 1
  end
end
