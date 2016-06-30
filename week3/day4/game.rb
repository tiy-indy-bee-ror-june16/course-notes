require './player'

class Game

  attr_accessor :player_one,
                :player_two,
                :war_count,
                :rounds

  def initialize
    @player_one = Player.new("Player One")
    @player_two = Player.new("Player Two")
    @war_count = 0
    @rounds = 0
  end

  def play
    intro
    until game_over?
      hand
    end
    outro
  end

  def intro
    puts "Hi. Let's play a simulated game of War."
  end

  def outro
    puts "#{winner} #{score} after #{rounds} and #{war_count}."
  end

  def winner
    if player_one.winnings.length > player_two.winnings.length
      player_one.name + " won"
    elsif player_two.winnings.length > player_one.winnings.length
      player_two.name + " won"
    else
      "The players tied"
    end
  end

  def score
    "#{player_one.winnings.length}-#{player_two.winnings.length}"
  end

  def game_over?
    player_one.dry? || player_two.dry?
  end

  def hand
    self.rounds += 1
    card1 = player_one.draw
    card2 = player_two.draw
    if card1.value > card2.value
      player_one.winnings += [card1, card2]
    elsif card2.value > card1.value
      player_two.winnings += [card1, card2]
    else
      self.war_count += 1
    end
  end

end

Game.new.play
