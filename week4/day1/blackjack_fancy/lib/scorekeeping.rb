# Contains class methods for keeping score
# Also detects winning and losing streaks.
module Scorekeeping
  attr_writer :games, :winners

  def games
    @games ||= 0
  end

  def winners
    @winners ||= []
  end

  def streak?
    streak > 2
  end

  def streak
    winners.reverse.take_while { |win| win == 'player' }.length
  end

  def mortgage?
    losing_streak > 4
  end

  def losing_streak
    winners.reverse.take_while { |win| win == 'dealer' }.length
  end

  def streak_output
    puts "You've won #{streak} in a row!" if streak?
    mortgage = "Um. You've lost #{losing_streak} in a row."
    mortgage += ' Maybe cut your losses?'
    puts mortgage if mortgage?
  end

  def goodbye
    puts 'Thanks for playing!'
    results = "You won #{winners.count('player')}"
    results += " of #{games} hands."
    puts results
  end
end
