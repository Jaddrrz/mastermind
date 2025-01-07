class Code 
  attr_accessor :one, :two, :three, :four

  def initialize(one, two, three, four)
    @code = [one, two, three, four]
  end

  def guess_code(one, two, three, four)
    puts "#{Player.name} has guessed: \n #{one}, #{two}, #{three}, #{four}"
    guess = [one, two, three, four]
    guess
  end

  def feedback_code
    
  end
end