require 'minitest/autorun'
require_relative '../lib/shoe'

# Test suite for lib/shoe.rb
# Represents a shuffled collection of seven decks
class ShoeTest < MiniTest::Test
  def setup
    @shoe = Shoe.new
  end

  def test_a_shoe_is_seven_decks
    assert @shoe.length == 52 * 7
  end

  def test_a_shoe_is_shuffled_throughout
    decks = @shoe.each_slice(52).map do |deck|
      deck.map(&:to_s).sort
    end
    assert decks.uniq.length == 7
  end
end
