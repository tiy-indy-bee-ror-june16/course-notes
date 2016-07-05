# A hint system for blackjack
# Using tips found here: http://www.blackjackbee.com/blackjack_tips.php
module Advisor
  def advisor(hand:)
    if split?(hand)
      'split'
    elsif stand?(hand) && !soft_hit?(hand)
      'stand'
    else
      'hit'
    end
  end

  def all_card?(hand, face)
    hand.cards.all? { |card| card.face == face }
  end

  def stand?(hand)
    hand.value >= 17 ||
      (hand.between?(12, 16) &&
       dealer_hand.show_card.between?(2, 6))
  end

  def soft_hit?(hand)
    (hand.soft? && hand.value <= 17) ||
      (hand.soft? && hand.value == 18 &&
       dealer_hand.show_card.between?(8, 10))
  end

  def split?(hand)
    all_card?(hand, 'Ace') ||
      all_card?(hand, '8') ||
      dealer_dependent_split(hand)
  end

  def dealer_dependent_split(hand)
    split_twos_threes?(hand) ||
      split_sixes?(hand) ||
      split_sevens?(hand) ||
      split_nines?(hand)
  end

  def split_twos_threes?(hand)
    (all_card?(hand, '2') ||
     all_card?(hand, '3')) &&
      dealer_hand.show_card.between?(4, 7)
  end

  def split_sixes?(hand)
    all_card?(hand, '6') && dealer_hand.show_card.between?(3, 6)
  end

  def split_sevens?(hand)
    all_card?(hand, '7') && dealer_hand.show_card.between?(3, 7)
  end

  def split_nines?(hand)
    all_card?(hand, '9') &&
      [2, 3, 4, 5, 6, 8, 9].include?(dealer_hand.show_card.value)
  end
end
