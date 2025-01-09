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
    
    guesses[attempt.to_i - 1].each_with_index do |color, index1|
      secret_code.each_with_index do |secret_color, index2|
        if (color == secret_color) && (index1 == index2) # Check which colors are on same positions, that is indexes
          counter1 += 1
        elsif (color == secret_color) && (index1 != index2) # Check the ones that are not on same position
          counter2 += 1
        # elsif (color == secret_color) && (index1 != index2) && (secret_code.count(color) > 1)
        #   counter2 -= 1
        end
      end
    end
    
    puts "Feedback: #{counter1} on the right spot, #{counter2} on the wrong spot"
  end
end