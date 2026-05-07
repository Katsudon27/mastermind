class GameBoard
  def initialize
    @board = Array.new(12) { Hash.new }
    @board.each do |board_row|
      board_row[:guess] = Array.new(4, "\u25EF").push "|"
      board_row[:feedback] = Array.new(4, "\u25CC")
    end
  end

  def print_board
    @board.each do |board_row|
      puts board_row.flat_map {|key,value| [value]}.join(" ")
    end
  end
end
