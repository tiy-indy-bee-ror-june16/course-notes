# Represents a dealer's hand played by the computer
class ComputerHand < Hand
  def hit?
    check_busted
    value < 16
  end

  def show_card
    cards.first
  end

  def check_busted
    busted?
  end
end
