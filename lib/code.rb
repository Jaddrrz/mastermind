class Code 
  attr_accessor :one, :two, :three, :four, :guess

  @@colors = ["red", "orange", "yellow", "green", "blue", "purple"]
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

  def feedback_code
    
  end
end