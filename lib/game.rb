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
    feedback
  end

  def check_win?(guess, answer)
    guess == answer ? true : false
  end

  def play_round(answer)
    guess = @code_guesser.makeGuess
    feedback = evaluate_guess(guess, answer)
    @number_of_guesses += 1
    @game_board.place_guess(@number_of_guesses, guess)
    @game_board.place_feedback(@number_of_guesses, feedback)
    guess
  end

  def start_game
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
