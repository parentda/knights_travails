class Node
  atr_reader :coords

  def initialize(coords)
    @coords = coords
    @next_moves = {}
  end
end
