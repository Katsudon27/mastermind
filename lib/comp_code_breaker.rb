require_relative "code_breaker"

class ComputerCodeBreaker < CodeBreaker
  def makeGuess
    Array.new(4) { rand(1..6).to_s }
  end
end
