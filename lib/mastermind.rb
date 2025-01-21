require "./player"
require "./code.rb"
 

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


player_one = start_game

puts player_one.name

#secret_code = Code.create_secret_code()
secret_code = ["Yellow", "Red", "Blue", "Red"]
p secret_code
puts "\nThe secret code has been created, try to win within 4 guesses! Only rainbow colors are used!"

guesses = Array.new(4, Array.new)

Code.guess_code(1, guesses)

Code.feedback_code(1, guesses, secret_code)


# Make secret code
#   Call PLayer class, get their name and what role they want to play
#   Call Code class, create the secret code, or asssign the player's secret one
#
# Make guess attempt
#   Use guess_code function within the Code class to either take the input of player or create a random one from the computer 
# 
# Make feedback
#   Use feedback_code function that puts "Player (or computer) has put X pegs"
# 
# Check if guess is right
# 
# Repeat
# 
# Announce winner