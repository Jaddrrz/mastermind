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
    counter3 = 0
    wrong_spot = false
    
    guesses[attempt.to_i - 1].each_with_index do |color, index1|
      wrong_spot = false # Reset the wrong_spot variable for every iteration

      secret_code.each_with_index do |secret_color, index2|
        if (color == secret_color) && (index1 == index2) # Check which colors are on same positions, that is indexes
          counter1 += 1
        elsif (color == secret_color) && (index1 != index2) && (wrong_spot == false) # Check the ones that are not on same position
          counter2 += 1               
          wrong_spot = true
        end
      end
    end

    if counter2 > 3
      counter3 = counter2 - counter1
    else
      counter3 = counter2
    end
  
    puts "Feedback: #{counter1} on the right spot, #{counter3} on the wrong spot"
  end
end