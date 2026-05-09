require_relative "code_breaker"

class ComputerCodeBreaker < CodeBreaker
  def initialize
    @possible_combos = ("1".."6").to_a.repeated_permutation(4).to_a
    @guess = []
  end

  def makeGuess(feedback = "")
    temp_feedback = []
    if feedback == ""
      @guess = ["1", "1", "2", "2"]
    else
      @possible_combos.delete(@guess)
      @possible_combos.each do |combo|
        @guess.each_with_index do |digit, index|
          if combo[index] == digit
            temp_feedback << "1"
          elsif combo.include?(digit)
            if @guess.count(digit) >= 2 
              next unless combo.count(digit) == @guess.count(digit)
              temp_feedback << "2"
            end
            temp_feedback << "2"
          end
        end
        if feedback.sort != temp_feedback.sort
          @possible_combos.delete(combo) 
        end
        temp_feedback = []
      end
      @guess = @possible_combos[0]
    end

    @guess
  end
end
