require "./player"
require "./code.rb"

player_one = Player.new("Andre", "guesser")
puts player_one.name

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