require "colorize"

# A class that represents the game board for the Mastermind game
class GameBoard
  def initialize
    # Initialise an array with two columns of symbols, each representing the guesses and feedback respectively.
    @board = Array.new(12) { {} }
    @board.each do |board_row|
      board_row[:guess] = Array.new(4, "\u25EF").push "|"
      board_row[:feedback] = Array.new(4, "\u25CC")
    end

    @color_pegs = { "1" => :red, "2" => :green, "3" => :yellow, "4" => :blue, "5" => :cyan, "6" => :magenta }
    @feedback_pegs = { "1" => :red, "2" => :white }
  end

  def print_board
    puts "---------------------------------------"
    puts " Colour |   Key"
    @board.each do |board_row|
      puts board_row.flat_map { |_key, value| [value] }.join(" ")
    end
  end

  # Update the corresponding row of guess with new symbols
  def place_guess(guess_num, guess)
    guess.each_with_index do |digit, index|
      @board[guess_num - 1][:guess][index] = "\u25CF".colorize(@color_pegs[digit])
    end
  end

  # Update the corresponding row of feedback with new symbols
  def place_feedback(guess_num, feedback)
    feedback.each_with_index do |digit, index|
      @board[guess_num - 1][:feedback][index] = "\u25C9".colorize(@feedback_pegs[digit])
    end
  end
end
