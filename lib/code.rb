class Code 
  attr_accessor :one, :two, :three, :four, :guess

  @@colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
  @@secret_code = []

  def initialize(one, two, three, four)
    @code = [one, two, three, four]
  end

  def self.create_secret_code
   [@@colors.sample, @@colors.sample, @@colors.sample, @@colors.sample]
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

  def self.feedback_code(attempt, guesses, secret_code)
   
    counter1 = 0
    counter2 = 0
    test_array = Array.new(4)
  
    used = false
    
    # guesses[attempt.to_i - 1].each_with_index do |color, index1|
    #   wrong_spot = false # Reset the wrong_spot variable for every iteration

    #   secret_code.each_with_index do |secret_color, index2|
    #     if (color == secret_color) && (index1 == index2) # Check which colors are on same positions, that is indexes
    #       counter1 += 1
    #       wrong_spot = true
    #       test_array[index1] = "X"
    #       p test_array
    #     elsif (color == secret_color) && (index1 != index2) && (wrong_spot == false) & (test_array[1] != "X") # Check the ones that are not on same position
    #       counter2 += 1               
    #       wrong_spot = true
    #     end
    #   end
    # end

    guesses[attempt.to_i - 1].each_with_index do |color, index1|
       # Reset the wrong_spot variable for every iteration

      secret_code.each_with_index do |secret_color, index2|
        if (color == secret_color) && (index1 == index2) # Check which colors are on same positions, that is indexes
          counter1 += 1
       
          test_array[index2] = "X"
          p test_array
        end
      end
    end

    guesses[attempt.to_i - 1].each_with_index do |color, index1|
      used = false # Reset the wrong_spot variable for every iteration

      secret_code.each_with_index do |secret_color, index2|
        if (color == secret_color) && (index1 != index2) && (test_array[index2] != "X") && (used == false) # Check the ones that are not on same position
          p "hey"
          counter2 += 1               
          used == true
        end
      end
    end
    

    # repetitions = guesses.tally
    # if repetitions.value?(2)
    #   counter2 -= 1
    # elsif repetitions.value?(3)
    #   counter2 -= 2
    # elsif repetitions.value?(4)
    #   counter2 -=3
    # end
  
    puts "Feedback: #{counter1} on the right spot, #{counter2} on the wrong spot"
  end
end