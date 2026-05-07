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
end
