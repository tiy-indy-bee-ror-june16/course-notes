require 'minitest/autorun'
require_relative '../lib/hand'

# Test suit for lib/hand.rb
# Represents a hand at play in a blackjack game
class HandTest < MiniTest::Test
  def setup
    @hand = Hand.new
    @jack = Card.new('Jack', 'Clubs')
    @ace  = Card.new('Ace', 'Spades')
    @two  = Card.new('2', 'Diamonds')
    @four = Card.new('4', 'Hearts')
  end

  def test_blackjack
    @hand.cards << @jack
    @hand.cards << @ace
    assert @hand.blackjack?
    assert @hand.twenty_one?
    assert @hand.winning?
    assert @hand.over?
  end

  def test_busted
    @hand.cards += [@two, @jack, @jack]
    assert @hand.busted?, "The hand value is currently #{@hand.value}"
    assert @hand.over?
  end

  def test_ace_acclimation
    @hand.cards += [@ace, @jack, @two]
    refute @hand.busted?
    assert @hand.value == 13
  end

  def test_a_hand_can_be_dealt
    @hand.deal([@ace, @jack])
    assert @hand.cards.length == 2
    @hand.deal([@two])
    assert @hand.cards.length == 3
  end

  def test_a_better_hand_is_greater
    @hand.deal([@jack, @two, @two])
    hand2 = Hand.new
    hand2.deal([@jack, @two])
    assert @hand > hand2
  end

  def test_a_longer_hand_wins
    @hand.deal([@jack, @two, @two, @two, @two])
    hand2 = Hand.new
    hand2.deal([@jack, @four, @four])
    assert @hand > hand2
  end

  def test_six_and_safe
    @hand.deal([@four, @four, @four, @two, @two, @two])
    assert @hand.six_and_safe?
    assert @hand.winning?
    assert @hand.over?
  end

  def test_to_s
    @hand.deal([@two, @ace])
    assert @hand.to_s == "a 2 of Diamonds\na Ace of Spades"
  end

  def test_a_stayed_hand_is_over
    @hand.deal([@two, @four])
    @hand.stayed = true
    assert @hand.stayed?
    assert @hand.over?
  end

  def test_hands_can_be_sorted
    @hand.deal([@ace, @jack])
    hand2 = Hand.new
    hand2.deal([@jack, @four])
    assert [@hand, hand2].sort == [hand2, @hand],
           "Actually, it's #{[@hand, hand2].sort}"
  end

  def test_splittable
    @hand.deal([@ace, @ace])
    assert @hand.splittable?
    @hand.deal([@two])
    refute @hand.splittable?
  end

  def test_a_hand_is_soft_if_it_has_aces
    @hand.deal([@ace, @two])
    assert @hand.soft?
  end

  def test_a_hand_value_can_be_checked_for_between
    @hand.deal([@two, @jack])
    assert @hand.between?(9, 14)
  end

  def test_aces_should_revert_to_11_on_split
    @hand.deal([@ace, @ace])
    refute @hand.busted?
    hands = Hand.split_hand(@hand, Shoe.new)
    hands.each do |hand|
      assert hand.cards.detect { |card| card.face = 'Ace' && card.value == 11 }
    end
  end

  def test_split_hand_with_no_devalued_aces
    @hand.deal([@ace, @four])
    hands = Hand.split_hand(@hand, Shoe.new)
    assert hands.first.cards.detect do |card|
      card.face = 'Ace' && card.value == 11
    end
  end
end
