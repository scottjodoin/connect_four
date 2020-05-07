module Display
  def self.get_column (player)
    puts "1 2 3 4 5 6 7"
    puts "\n#{player.class.name} #{player.token}, please enter a column (1-7):"
  end

  def self.end_game(player)
    puts "\nCongrats, #{player.class.name} #{player.token}, you win!"
  end
end