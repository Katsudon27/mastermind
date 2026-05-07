require_relative "code_guesser"
require_relative "code_maker"
require_relative "game_board"

class Game
  def initialize()
    @code_maker = CodeMaker.new(self)
    @code_guesser = CodeGuesser.new(self)
    @game_board = GameBoard.new()
  end

  def evaluate_guess(guess, answer)
    feedback = []
    guess.each_with_index do |digit, index|
      if answer.include?(digit)
        answer.index(digit) == index ? feedback << "1" : feedback << "2"
      end
    end
    feedback
  end
end
