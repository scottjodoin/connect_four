class Board
  attr_reader :board
  def initialize
    @board = Array.new(7) {Array.new}
  end

  def full? (x)
    return true if x < 0 or x >= 7
    return @board[x].length >= 6
  end

  def four? (check)
    @board.length.times do |x|
      @board[x].length.times do |y|
        return true if eminate?(x,y) == check
      end
    end
    return false
  end

  def eminate?(x,y)
    #returns src if 'check' is going in all 4 directions
    src = at(x,y)
    return nil if src.nil?
    [
      [ 1, 0], [ 2, 0], [ 3, 0], #horizontal
      [ 0, 1], [ 0, 2], [ 0, 3], #vertical
      [ 1, 1], [ 2, 2], [ 3, 3], #diagonal1
      [-1, 1], [-2, 2], [-3, 3]  #diagonal2
    ].each_slice(3) do |deltas|
      #could be faster if next iterator broke on nil
      return src if deltas.all? { |delta|
        val = at(x + delta[0], y + delta[1])
        break if val.nil?
        src == val
        }
    end
    return nil
  end

  def at(x,y)
    return nil unless inside?(x,y)
    return @board[x][y]
  end

  def inside?(x,y)
    return false if x < 0 or x >= 7
    return false if y < 0 or y >= @board[x].length
    return true
  end

  def drop!(value, x)
    x = 0 if x < 0
    x = 6 if x >= 7
    @board[x].append value
  end

  def to_s
    rows = ""
    (5).downto(0).each do |y|
      row = Array.new()
      (6).downto(0).each do |x|
        value = at(x,y)
        row.unshift((value.nil?) ? ["_"] : [value.to_s])
      end
      rows += row.join("|") + "\n"
    end
    return rows
  end
end
