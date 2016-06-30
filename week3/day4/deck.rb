require './card'

class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card.faces.each do |face|
        @cards << Card.new(face, suit)
      end
    end
    @cards.shuffle!
  end

  def draw
    cards.shift
  end

  def empty?
    cards.length == 0
  end

end
