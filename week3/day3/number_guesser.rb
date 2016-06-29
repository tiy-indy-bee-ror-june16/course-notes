rematch = true
puts "Hi. Let's play a game. What number would you like for our max range?"
max = gets.chomp.to_i
puts "I'll pick a number between 1 and #{max}."
puts "And tell you if your guess is high or low."

while rematch
  computer = rand(1..max)

  puts "OK. I've picked. Time to guess!"

  guess = 0

  until computer == guess

    guess = gets.chomp.to_i

    if guess > computer
      puts "Too high. Guess again."
    elsif guess < computer
      puts "Too low. Guess again."
    end

  end

  puts "You got it! The number was #{computer}!"

  puts "Would you like a rematch (Y/N)?"

  response = gets.chomp&.downcase[0]

  rematch = response == "y" ? true : false

end

puts "Thanks for playing!"

