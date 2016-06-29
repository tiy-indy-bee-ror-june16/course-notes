require './die'
require './loaded_die'

class Game

  attr_accessor :player, :computer, :player_roll, :computer_roll

  def initialize
    @player = 2.times.map{|d| Die.new}
    @computer = 2.times.map{|d| LoadedDie.new}
  end

  def intro
    puts "Let's play HiLo. We each roll two die, highest total wins!"
    puts "Ready to go?"
    gets
  end

  def play(say_intro=true)
    intro if say_intro
    turn("computer")
    puts "I rolled a total of #{computer_roll}"
    puts "Your roll!"
    gets
    turn("player")
    puts "You rolled a total of #{player_roll}"
    determine_winner
    ask_for_rematch
  end

  def determine_winner
    if computer_roll > player_roll
      puts "I WIN!! DESTROY ALL HUMANS!"
    elsif computer_roll < player_roll
      puts "you win. :("
    else
      puts "We tied ..."
    end
  end

  def ask_for_rematch
    puts "Would you like to play again?"
    resp = gets.chomp&.downcase[0]
    if resp == "y"
      Game.new.play(false)
    else
      puts "Thanks for playing."
    end
  end

  def turn(this_player)
    self.send(
      this_player + "_roll=",
      self.send(this_player).inject(0){|sum, die| sum += die.roll}
    )
  end

end

Game.new.play
