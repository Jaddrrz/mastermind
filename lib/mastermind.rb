require "./player"
require "./secret_code"

COLORS = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]

def start_game()
  puts "Hello, you are playing Mastermind. What's your name?"
  player1_name = gets.chomp.capitalize.to_s
  
  puts "\n#{player1_name}, which role do you want to play, the creator or the guesser of the code?"
  player1_role = gets.chomp.capitalize.to_s
  
  while ["Creator", "Guesser"].include?(player1_role) == false
    puts "Couldn't understand, type again"
    player1_role = gets.chomp.capitalize.to_s
  end
  
  puts "\n#{player1_role}? Good choice."
  if player1_role == "Creator"
    puts "Now, create your secret code:"
  end
  
  player_one = (Player.new(player1_name, player1_role))
  player_one
end

def player_guesses(game)
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
    
    # Guess code to push into guesses
    guess = SecretCode.get_code() 
    puts "You have guessed [#{guess.join(' - ')}]"
    guesses << guess
    SecretCode.feedback_code(guess_counter, guesses, secret_code)
    
    if SecretCode.guessed_right?(guess_counter, guesses, secret_code)
      puts "You won!"
      break
    end
    guess_counter += 1
    if guess_counter == 8
      puts "\nYou're out of attempts, better luck next time!"
    end
  end
end

def computer_guesses(game)
  guess_counter = 1
  guesses = []
  secret_code = game.secret_code
  results = []
  
  3.times do
    if guess_counter < 3
      puts "\nAttempt number #{guess_counter}"
    else 
      puts "\nLast attempt"
    end  

    guess = [COLORS.sample, COLORS.sample, COLORS.sample, COLORS.sample]
    puts "The computer has guessed #{guess}"
    guesses << guess
    feedback = SecretCode.feedback_code(guess_counter, guesses, secret_code)
    results << feedback

    if SecretCode.guessed_right?(guess_counter, guesses, secret_code)
      puts "The computer has won!"
      break
    end
    
    guess_counter += 1
    if guess_counter == 8
      puts "\nThe computer is out of attempts, you won!"
    end
  end
end

player = start_game()

game = SecretCode.new(player)


computer_guesses(game)

