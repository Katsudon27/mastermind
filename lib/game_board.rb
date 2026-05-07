class GameBoard
  def initialize
    @board = Array.new(12) { Array.new(2) { Array.new(4) } }
    @board = @board.map do |value|
      value.each_with_index.map do |array, index|
        case index
        when 0
          array.map do |item|
            item = "\u25EF"
          end.push("|")
        when 1
          array.map do |item|
            item = "\u25CC"
          end
        end
      end
    end
  end

  def print_board
    @board.each do |row|
      puts row.map { |board_row| board_row.to_a}.join(" ")
    end
  end
end
