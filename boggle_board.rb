class BoggleBoard
  def initialize
    @board = Array.new(4){Array.new(4)}
  end

  def shake!
    dices = Dices.read
    dices.each do |die|
      dices = Array.new(6){die.split(//)}
    end
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        @board[row_index][col_index] = ljust(replace_q(dices.sample.sample))
      end
    end
    to_s(@board)
  end

  def replace_q(char)
    if char == "Q"
      "Qu"
    else
      char
    end
  end

  def ljust(element)
    element.ljust(3)
  end

  def to_s(array)
    array.each do |row|
      puts row.join(" ")
    end
  end
end

class Dices
  def self.read
    @dices = []
    File.foreach("dices.txt") do |line|
      line.gsub!("\n", "")
      @dices << line
    end
    @dices
  end
end


board = BoggleBoard.new
# puts board

board.shake!
