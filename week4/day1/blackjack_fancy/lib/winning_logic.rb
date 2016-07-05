# Handles the guts of determining a winner
module WinningLogic
  def player_winning?(hand)
    !dealer_hand.blackjack? && !hand.busted? && winning_comparisons(hand)
  end

  def winning_comparisons(hand)
    hand.winning? || dealer_hand.busted? || hand >= dealer_hand
  end

  def winner(hand:)
    if player_winning?(hand)
      self.class.winners << 'player'
      'You'
    else
      self.class.winners << 'dealer'
      'The house'
    end
  end
end
