class Player
  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def get_column(board)
    loop do
      input = gets.chomp.to_i
      input -= 1
      return input unless board.full?(input) or input == -1
    end
  end
end

class HumanPlayer < Player
end

class MonkeyPlayer < Player

  def get_column(board)
    loop do
      input = rand(0..6)
      return input unless board.full?(input)
    end
  end
end

class ComputerPlayer < Player
end
