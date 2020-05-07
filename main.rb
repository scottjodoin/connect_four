require "./board.rb"
require "./players.rb"
require "./display.rb"

class Game
  attr_reader :board
  @players
  def initialize(players)
    @players = players
    reset
  end

  def reset
    @board = Board.new()
    @players.shuffle!
  end

  def play
    loop do
      break unless round
    end
    puts @board.to_s
    Display.end_game(@players[0])
  end

  def round
    player = @players[0]

    #show the board
    puts @board.to_s

    #current player drops
    Display.get_column(player)
    column = player.get_column(@board)
    board.drop!(player.token, column)
    puts "#{player.class.name} #{player.token} placed column #{column + 1}."

    #check if win, end game
    return false if board.four?(player.token)
    #change to other player
    @players.rotate!

    return true
  end
end


game = Game.new([HumanPlayer.new("O"), HumanPlayer.new("X")])
game.play
