require_relative 'deck'

# Seven decks are these
class Shoe < Deck
  def populate
    7.times { super }
  end
end
