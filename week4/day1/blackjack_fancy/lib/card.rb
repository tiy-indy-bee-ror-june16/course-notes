# Represents a card.
# Will be integral to decks, shoes and hands
class Card
  attr_accessor :face, :suit, :value

  def initialize(face, suit)
    self.face = face
    self.suit = suit
    self.value = set_value
  end

  def self.suits
    %w(Clubs Spades Diamonds Hearts)
  end

  def self.faces
    (2..10).to_a + %w(Jack Queen King Ace)
  end

  def self.value_map
    {
      'Ace'   => 11,
      'King'  => 10,
      'Queen' => 10,
      'Jack'  => 10
    }
  end

  def set_value
    self.class.value_map[face] || face.to_i
  end

  def between?(starter, ender)
    starter = self.class.faces.index(starter) + 2 if starter.is_a? String
    ender = self.class.faces.index(ender) + 2 if ender.is_a? String
    value.between?(starter, ender)
  end

  def +(other)
    value + other.value
  end

  # Allows me to do `array_of_cards.inject(:+)`
  def coerce(other)
    [other, value]
  end

  def to_s
    "a #{face} of #{suit}"
  end
end
