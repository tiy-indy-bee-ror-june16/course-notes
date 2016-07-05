require 'minitest/autorun'
require_relative '../lib/blackjack'

# Test suite for lib/blackjack.rb
class BlackjackTest < MiniTest::Test
  def setup
    @game = Blackjack.new(false)
    @ace = Card.new('Ace', 'Diamonds')
    @jack = Card.new('Jack', 'Clubs')
    @two = Card.new('2', 'Hearts')
    @seven = Card.new('7', 'Spades')
    reset_scoring
  end

  def test_blackjack_dealer_wins
    deal_identical_winning_hands
    assert @game.winner(hand: @game.player_hands.first) == 'The house'
    assert @game.class.winners == %w(dealer)
    assert @game.class.games = 1
  end

  def test_player_blackjack_wins
    @game.player_hands.first.deal([@ace, @jack])
    @game.dealer_hand.deal([@jack, @two, @two, @two])
    assert @game.winner(hand: @game.player_hands.first) == 'You'
    assert @game.class.winners == %w(player)
  end

  def test_streak
    @game.class.winners = %w(player player player player dealer player).reverse
    assert @game.class.streak?
    assert @game.class.streak == 4
  end

  def test_mortgage
    @game.class.winners = %w(dealer player dealer dealer dealer dealer dealer)
    assert @game.class.mortgage?, @game.class.mortgage?
    assert @game.class.losing_streak == 5, @game.class.losing_streak
  end

  def test_deal_hands
    @game.deal_hands
    assert hands.all? { |hand| hand.cards.length == 2 }
    refute hands.any?(&:busted?)
  end

  def test_hit
    @game.deal_hands
    @game.decision(hand: @game.player_hands.first, hs: 'h')
    assert @game.player_hands.first.cards.length == 3
  end

  def test_stay
    @game.deal_hands
    @game.decision(hand: @game.player_hands.first, hs: 's')
    assert @game.player_hands.first.cards.length == 2
  end

  def test_show_hands_limited
    deal_player_win
    show_hand = @game.show_hands(hand: @game.player_hands.first)
    assert show_hand == censored_show_hands, show_hand.inspect
  end

  def test_show_hands_full
    deal_player_win
    show_hand = @game.show_hands(hand: @game.player_hands.first, full: true)
    assert show_hand == full_show_hands
  end

  def test_dealer_turn
    @game.player_hands.first.deal([@jack, @seven])
    @game.dealer_hand.deal([@jack, @two])
    @game.dealer_turn
    assert @game.dealer_hand.cards.length > 2
  end

  def test_splitting
    @game.player_hands.first.deal([@ace, @ace])
    @game.dealer_hand.deal([@jack, @two])
    @game.split_hand(@game.player_hands.first)
    assert @game.player_hands.length == 2
  end

  private

  def reset_scoring
    @game.class.winners = []
    @game.class.games = 0
  end

  def deal_identical_winning_hands
    @game.player_hands.first.deal([@ace, @jack])
    @game.dealer_hand.deal([@ace, @jack])
  end

  def deal_player_win
    @game.player_hands.first.deal([@ace, @jack])
    @game.dealer_hand.deal([@jack, @two])
  end

  def hands
    [@game.dealer_hand, @game.player_hands].flatten
  end

  def censored_show_hands
    str = "You're holding:\na Ace of Diamonds\n"
    str += "a Jack of Clubs\n\nThe dealer is showing:\n"
    str + "a Jack of Clubs\n"
  end

  def full_show_hands
    str = "You're holding:\na Ace of Diamonds\n"
    str += "a Jack of Clubs\n\nThe dealer is showing:\n"
    str + "a Jack of Clubs\na 2 of Hearts"
  end
end
