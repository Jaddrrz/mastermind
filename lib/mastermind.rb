require "./player"
require "./code"


def start_game()
  puts "Hello, you are playing Mastermind. What's your name?"
  player1_name = gets.chomp.capitalize.to_s
  
  puts "\n#{player1_name}, which role do you want to play, the creator or the guesser of the code?"
  player1_role = gets.chomp.capitalize.to_s
  
  while ["Creator", "Guesser"].include?(player1_role) == false
    puts "Couldn't understand, type again"
    player1_role = gets.chomp.capitalize.to_s
  end
  
  puts "\n#{player1_role}? Good choice"
  
  player_one = (Player.new(player1_name, player1_role))
  return player_one
end

def guess_round(game)
  guess_counter = 1
  guesses = []
  secret_code = game.secret_code
  p secret_code
  puts "\nThe secret code has been created, try to win within 7 guesses! Only rainbow colors are used! (Red, Orange, Yellow, Green, Blue, Purple)"
  
  7.times do 
    if guess_counter < 7
      puts "\nAttempt number #{guess_counter}"
    else 
      puts "\nLast attempt"
    end  
    Code.guess_code(guess_counter, guesses)
    Code.feedback_code(guess_counter, guesses, secret_code)
    if Code.guessed_right?(guess_counter, guesses, secret_code)
      puts "You won!"
      break
    end
    guess_counter += 1
    if guess_counter == 8
      puts "\nYou're out of attempts, better luck next time!"
    end
  end
end


player = start_game()

game = Code.new(player.role)

# guess_round(game)

