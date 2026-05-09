require_relative "code_breaker"

# A class for the Computer version of the Code Breaker
class ComputerCodeBreaker < CodeBreaker
  def initialize
    super
    @possible_combos = ("1".."6").to_a.repeated_permutation(4).to_a
    @guess = []
  end

  # Makes guesses to break the code with the Swaszek strategy
  def make_guess(feedback = "")
    temp_feedback = []
    # Start with initial guess of 1 1 2 2
    if feedback == ""
      @guess = %w[1 1 2 2]
    else
      @possible_combos.delete(@guess)

      # Evaluate each combination as if they were the answer against previous guess
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

        # Remove combinations that would not yield the same feedback as the previous guess
        @possible_combos.delete(combo) if feedback.sort != temp_feedback.sort
      end
      @guess = @possible_combos[0]
    end

    @guess
  end
end
