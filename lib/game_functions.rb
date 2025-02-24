module GameFunctions
  def test1()
    p "hello"
  end
  
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
end