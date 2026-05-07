require "colorize"

require_relative "code_guesser"
require_relative "code_maker"
require_relative "game_board"

class Game
  def initialize()
    @code_maker = CodeMaker.new(self)
    @code_guesser = CodeGuesser.new(self)
    @game_board = GameBoard.new()
    @number_of_guesses = 0
  end

  def evaluate_guess(guess, answer)
    feedback = []
    if check_win?(guess, answer)
      return ["1", "1", "1", "1"]
    end
    guess.each_with_index do |digit, index|
      if answer.include?(digit)
        answer.index(digit) == index ? feedback << "1" : feedback << "2"
      end
    end
    feedback.shuffle
  end

  def check_win?(guess, answer)
    guess == answer ? true : false
  end

  def play_round(answer)
    print_colours
    guess = @code_guesser.makeGuess
    feedback = evaluate_guess(guess, answer)
    @number_of_guesses += 1
    @game_board.place_guess(@number_of_guesses, guess)
    @game_board.place_feedback(@number_of_guesses, feedback)
    guess
  end
  
  def print_instructions
    puts "---------------------------------------"
    puts "Welcome to MASTERMIND"
    puts "---------------------------------------"
    puts "Your mission, should you choose to accept it:"
    puts "Decrypt the 4-digit sequence within 12 tries.".colorize(:red)
    puts "---------------------------------------"
    puts "To aid you in your mission, additional info for each guess will be provided in the form of key pegs:"
    print "\u25C9 ".colorize(:red)
    puts "RED PEG: Correct Colour + Correct Position"
    print "\u25C9 ".colorize(:white)
    puts "WHITE PEG: Correct Colour + Wrong Position"
    print "\u25CC "
    puts "EMPTY: No match found"
    puts "---------------------------------------"
    puts "START GAME"
  end

  def print_colours
    print "Available colours:"
    print " \u278A".colorize(:red)
    print " \u2777".colorize(:green)
    print " \u2778".colorize(:yellow)
    print " \u2779".colorize(:blue)
    print " \u277A".colorize(:cyan)
    print " \u277B \n".colorize(:magenta)
  end

  def start_game
    print_instructions
    answer = @code_maker.generateCode

    loop do
      @game_board.print_board

      guess = play_round(answer)

      if check_win?(guess, answer)
        @game_board.print_board
        puts "Congratulations! The #{@code_guesser} has won the game!"
        break
      elsif @number_of_guesses == 12
        @game_board.print_board
        puts "The #{@code_guesser} has run out of guesses. The #{@code_maker} has won the game!"
        break
      end
    end

    puts "GAME OVER"
  end
end
