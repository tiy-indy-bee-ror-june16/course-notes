require 'minitest/autorun'
require_relative '../lib/card'

# Test file for lib/card.rb
class CardTest < MiniTest::Test
  def setup
    @card1 = Card.new('Jack', 'Diamonds')
  end

  def test_face_card_value
    assert @card1.value == 10
  end

  def test_card_addition
    card2 = Card.new('Ace', 'Clubs')
    assert @card1 + card2 == 21
  end

  def test_to_s
    assert @card1.to_s == 'a Jack of Diamonds'
  end

  def test_can_be_added_to_numeric
    assert 10 + @card1 == 20
  end

  def test_can_be_checked_if_between
    assert @card1.between?(9, 'Queen')
    assert @card1.between?(9, 11)
  end
end
