require './deck'

class Player

  attr_accessor :name, :deck, :winnings

  def initialize(name)
    @name = name
    @deck = Deck.new
    @winnings = []
  end

  def draw
    deck.draw
  end

  def dry?
    deck.empty?
  end

end
