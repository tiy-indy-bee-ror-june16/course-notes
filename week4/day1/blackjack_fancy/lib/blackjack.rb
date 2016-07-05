require_relative 'shoe'
require_relative 'hand'
require_relative 'computer_hand'
require_relative 'winning_logic'
require_relative 'scorekeeping'
require_relative 'hand_output'
require_relative 'advisor'
require 'pry'

# The core of the blackjack game, covering:
# - Game flow
# - User interface
class Blackjack
  extend Scorekeeping
  include WinningLogic
  include HandOutput
  include Advisor

  attr_accessor :player_hands, :dealer_hand, :shoe, :output

  def initialize(output = true)
    self.shoe          = Shoe.new
    self.player_hands  = [Hand.new]
    self.dealer_hand   = ComputerHand.new
    self.output        = output
  end

  def play(greeting = true)
    self.class.games += 1
    welcome if greeting && output
    deal_hands
    player_turn unless dealer_hand.blackjack?
    dealer_turn
    winner_winner_chicken_dinner if output
    live_die_repeat if output
  end

  def welcome
    puts "Let's play blackjack. [enter]"
    STDIN.gets
  end

  def deal_hands
    player_hands.each { |hand| hand.deal(shoe.draw(2)) }
    dealer_hand.deal(shoe.draw(2))
  end

  def show_hands(hand:, full: false)
    if output
      puts hand_string(hand: hand, full: full)
    else
      hand_string(hand: hand, full: full)
    end
  end

  def player_turn
    player_hands.each_with_index do |hand, index|
      individual_hand(hand: hand, index: index) until hand.over?
    end
  end

  def individual_hand(hand:, index:)
    puts "Hand ##{index + 1}:" if player_hands.length > 1 && output
    show_hands(hand: hand) if output
    ask_the_player(hand) if output
    decision(hand: hand)
  end

  def ask_the_player(hand)
    query = 'Would you like to hit (h) or stand (s)'
    query += ' or split (p)' if hand.splittable?
    puts query
    puts "You can also hit (i) if you'd like a hint."
  end

  def decision(hand:, hs: nil)
    hs = STDIN.gets.chomp.downcase unless hs
    case hs
    when 'h' then draw_card(hand: hand)
    when 'p'
      self.class.games += 1
      split_hand(hand)
    when 'i' then puts advice(hand) if output
    else
      hand.stayed = true
    end
  end

  def advice(hand)
    "\n\nWe recommend you #{advisor(hand: hand)}\n\n"
  end

  def draw_card(hand:)
    hand.deal(shoe.draw)
    puts "You were dealt #{hand.cards.last}." if output
  end

  def split_hand(hand)
    player_hands.reject! { |ex_hand| ex_hand == hand }
    hand.split = true
    player_hands.push(*Hand.split_hand(hand, shoe))
    player_turn if output
  end

  def dealer_turn
    unless player_hands.all?(&:blackjack?) || player_hands.all?(&:busted?)
      dealer_hand.deal(shoe.draw) while dealer_hand.hit? && !dealer_hand.over?
    end
  end

  def winner_winner_chicken_dinner
    player_hands.each do |hand|
      show_hands(hand: hand, full: true)
      puts "#{winner(hand: hand)} won.\n\n\n"
    end
  end

  def live_die_repeat
    self.class.streak_output
    puts 'Would you like to play again? (y/n)'
    if STDIN.gets.chomp.casecmp('y') == 0
      Blackjack.new.play(false)
    else
      self.class.goodbye
    end
  end
end
