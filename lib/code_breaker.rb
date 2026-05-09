# A base class for the Code Breaker with human player making the guess
class CodeBreaker
  def make_guess(_feedback = "")
    loop do
      puts "Select 4 colours by typing in the corresponding numbers as your guess:"
      input = gets.chomp.to_s.chars

      return input if (input - ("1".."6").to_a).empty? && input.length == 4

      puts "Invalid input: Please try again"
    end
  end

  def to_s
    "Code Breaker"
  end
end
