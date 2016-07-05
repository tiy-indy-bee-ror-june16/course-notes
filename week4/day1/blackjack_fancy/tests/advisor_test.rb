require 'minitest/autorun'
require_relative '../lib/blackjack.rb'

# Test for the blackjack move advisor module
# Located at lib/advisor.rb
class AdvisorTest < MiniTest::Test
  def setup
    @game = Blackjack.new(false)
    @ace = Card.new('Ace', 'Hearts')
    @jack = Card.new('Jack', 'Spades')
    @eight = Card.new('8', 'Hearts')
    @two = Card.new('2', 'Clubs')
    @four = Card.new('4', 'Diamonds')
    @six = Card.new('6', 'Hearts')
    @seven = Card.new('7', 'Clubs')
    @nine = Card.new('9', 'Spades')
  end

  def test_it_should_recommend_splitting_aces
    @game.player_hands.first.deal([@ace, @ace])
    @game.dealer_hand.deal([@two, @two])
    assert @game.advisor(hand: @game.player_hands.first) == 'split'
  end

  def test_it_should_recommend_splitting_eights
    @game.player_hands.first.deal([@eight, @eight])
    @game.dealer_hand.deal([@two, @two])
    assert @game.advisor(hand: @game.player_hands.first) == 'split'
  end

  def test_it_should_recommend_standing_if_12_and_2
    @game.player_hands.first.deal([@eight, @four])
    @game.dealer_hand.deal([@two, @two])
    assert @game.advisor(hand: @game.player_hands.first) == 'stand'
  end

  def test_it_should_recommend_split_if_2_3_and_dealer_4_7
    @game.player_hands.first.deal([@two, @two])
    @game.dealer_hand.deal([@four, @four])
    assert @game.advisor(hand: @game.player_hands.first) == 'split'
  end

  def test_it_should_recommend_split_if_6_and_dealer_3_6
    @game.player_hands.first.deal([@six, @six])
    @game.dealer_hand.deal([@four, @four])
    assert @game.advisor(hand: @game.player_hands.first) == 'split'
  end

  def test_it_should_recommend_split_if_7_and_dealer_3_7
    @game.player_hands.first.deal([@seven, @seven])
    @game.dealer_hand.deal([@four, @four])
    assert @game.advisor(hand: @game.player_hands.first) == 'split'
  end

  def test_it_should_recommend_split_if_9_and_dealer_thing
    @game.player_hands.first.deal([@nine, @nine])
    @game.dealer_hand.deal([@four, @four])
    assert @game.advisor(hand: @game.player_hands.first) == 'split'
  end

  def test_it_shouldnt_recommend_split_if_dealer_7
    @game.player_hands.first.deal([@nine, @nine])
    @game.dealer_hand.deal([@seven, @seven])
    refute @game.advisor(hand: @game.player_hands.first) == 'split'
  end

  def test_it_should_hit_for_soft_18_and_dealer_8_9_10
    @game.player_hands.first.deal([@ace, @seven])
    @game.dealer_hand.deal([@nine, @nine])
    assert @game.soft_hit?(@game.player_hands.first)
    assert @game.advisor(hand: @game.player_hands.first) == 'hit'
  end

  def test_it_should_hit_on_soft_17_or_lower
    @game.player_hands.first.deal([@ace, @six])
    assert @game.advisor(hand: @game.player_hands.first) == 'hit'
  end
end
