class Code 
  attr_accessor :guesses, :secret_code

  COLORS = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]

  def initialize(mode) # Generate or create code based on mode
    if mode == "Guesser"
      @secret_code = [@@colors.sample, @@colors.sample, @@colors.sample, @@colors.sample]
      @guesses = Array.new(4, Array.new)
    elsif mode == "Creator"
      
      # input = gets.chomp.split(" ").map(&:capitalize)
      
      # while 
      # for color in input do # Ask again for input if not accepted
      #   if COLORS.include?(color) == false
      #     puts "Type again"
      #     input = gets.chomp.split(" ").map(&:capitalize).to_s
      #   end
      # end
      
      @secret_code = Code.get_code
      puts "Your secret code is [#{@secret_code.join(' - ')}]"
    end
  end
  
  def self.get_code()
    puts "First color:"
    first = gets.chomp.capitalize.to_s
    while COLORS.include?(first) == false
      puts "Type again"
      first = gets.chomp.capitalize.to_s 
      p first
    end
    puts "Second color:"
    second = gets.chomp.capitalize.to_s 
    while COLORS.include?(second) == false
      puts "Type again"
      second = gets.chomp.capitalize.to_s 
    end
    puts "Third color:"
    third = gets.chomp.capitalize.to_s 
    while COLORS.include?(third) == false
      puts "Type again"
      third = gets.chomp.capitalize.to_s 
    end
    puts "Fourth color:"
    fourth = gets.chomp.capitalize.to_s 
    while COLORS.include?(fourth) == false
      puts "Type again"
      fourth = gets.chomp.capitalize.to_s 
    end
    code = [first, second, third, fourth]
    code
  end

  def self.guess_code(attempt, guesses)  
    guess = Code.get_code()
    puts "You have guessed [#{guess.join(' - ')}]"
    guesses << guess
  end

  def self.feedback_code(attempt, guesses, secret_code)
    counter1 = 0
    counter2 = 0

    used_indices_secret = []
    used_indices_guess = []

    # Check for colors in the correct spots
    secret_code.each_with_index do |secret_color, index|
      if secret_color == guesses[attempt.to_i - 1][index]
        counter1 += 1
        used_indices_secret << index
        used_indices_guess << index
      end
    end

    # Check for colors in the wrong spots
    secret_code.each_with_index do |secret_color, index1|
      next if used_indices_secret.include?(index1) # Skip already checked indices


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
      guesses[attempt.to_i - 1].each_with_index do |color, index2|
        if (color == secret_color) && (index1 != index2) && (!used_indices_guess.include?(index2))
          counter2 += 1
          used_indices_guess << index2 # Mark this index as checked
          used_indices_secret << index1 # Mark this index as checked
          break # Prevent counting the same color multiple times
        end
      end
    end

    puts "\nFeedback: #{counter1} on the right spot, #{counter2} on the wrong spot"
  end

  def self.guessed_right?(guess_counter, guesses, secret_code) # Determine if player has won
    if guesses[guess_counter - 1] == secret_code
      true
    else 
      false
    end
  end
end