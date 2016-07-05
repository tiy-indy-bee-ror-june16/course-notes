# Handles the display of hands in the game
module HandOutput
  def hand_string(hand:, full: false)
    str = "You're holding:\n"
    str += hand.to_s
    str += "\n\n"
    str += "The dealer is showing:\n"
    str + dealer_hand_show(full)
  end

  def dealer_hand_show(full = false)
    if full
      dealer_hand.to_s
    else
      dealer_hand.show_card.to_s + "\n"
    end
  end
end
