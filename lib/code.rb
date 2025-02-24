class Code 
  attr_accessor :guesses, :secret_code

  @@colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]

  def initialize(mode)
    if mode == "Guesser"
      @secret_code = [@@colors.sample, @@colors.sample, @@colors.sample, @@colors.sample]
      @guesses = Array.new(4, Array.new)
    elsif mode == "Creator"
      puts "Create your secret_code! \nFirst color:"
      first = gets.chomp.capitalize.to_s 
      puts "Second color:"
      second = gets.chomp.capitalize.to_s 
      puts "Third color:"
      third = gets.chomp.capitalize.to_s 
      puts "Fourth color:"
      fourth = gets.chomp.capitalize.to_s 
    
      @secret_code = [first, second, third, fourth]
    end
  end

  

  def self.guess_code(attempt, guesses)
    puts "First color:"
    first = gets.chomp.capitalize.to_s 
    puts "Second color:"
    second = gets.chomp.capitalize.to_s 
    puts "Third color:"
    third = gets.chomp.capitalize.to_s 
    puts "Fourth color:"
    fourth = gets.chomp.capitalize.to_s 
    
    guess = [first, second, third, fourth]
    puts "You have guessed #{guess}"
    guesses[attempt.to_i - 1] = guess
  end

#   def self.feedback_code(attempt, guesses, secret_code)
   
#     counter1 = 0
#     counter2 = 0

#     # Arrays to use as reference, each added element means position can't be used
#     test_array1 = Array.new(4)
#     test_array2 = Array.new(4)
  
#     # Reset variable
#     used = false
    
#     # guesses[attempt.to_i - 1].each_with_index do |color, index1|
#     #   wrong_spot = false # Reset the wrong_spot variable for every iteration

#     #   secret_code.each_with_index do |secret_color, index2|
#     #     if (color == secret_color) && (index1 == index2) # Check which colors are on same positions, that is indexes
#     #       counter1 += 1
#     #       wrong_spot = true
#     #       test_array[index1] = "X"
#     #       p test_array
#     #     elsif (color == secret_color) && (index1 != index2) && (wrong_spot == false) & (test_array[1] != "X") # Check the ones that are not on same position
#     #       counter2 += 1               
#     #       wrong_spot = true
#     #     end
#     #   end
#     # end

#     secret_code.each_with_index do |secret_color, index1|
#       guesses[attempt.to_i - 1].each_with_index do |color, index2|
#         if (color == secret_color) && (index1 == index2) # Check which colors are on same positions, that is indexes
#           counter1 += 1
       
#           test_array1[index1] = "X"
#           test_array2[index1] = "O"
#           p test_array1
#         end
#       end
#     end

#     secret_code.each_with_index do |secret_color, index1|
#       used = false # Reset used variable for every iteration

#       guesses[attempt.to_i - 1].each_with_index do |color, index2|
#         5
#         if (color == secret_color) && (index1 != index2) && (used == false) # Check the ones that are not on same position
#           counter2 += 1               
#           used = true # Prevent same color from being used for counter more than once
#           test_array2[index1] = "O"
#           p test_array2
#         end
#       end
#     end
    
#     puts "Feedback: #{counter1} on the right spot, #{counter2} on the wrong spot"
#   end
# end

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

      guesses[attempt.to_i - 1].each_with_index do |color, index2|
        if (color == secret_color) && (index1 != index2) && (!used_indices_guess.include?(index2))
          counter2 += 1
          used_indices_guess << index2 # Mark this index as checked
          used_indices_secret << index1 # Mark this index as checked
          break # Prevent counting the same color multiple times
        end
      end
    end

    puts "Feedback: #{counter1} on the right spot, #{counter2} on the wrong spot"
  end
end