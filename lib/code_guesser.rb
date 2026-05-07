require_relative "player"

class CodeGuesser < Player
  def makeGuess
    puts "Available colours: 1 for Red, 2 for Green, 3 for Yellow, 4 for Blue, 5 for Cyan, 6 for Purple"
    loop do
      puts "Select 4 colours by typing in the corresponding numbers as your guess:"
      input = gets.chomp.to_s.split("")

      if (input - ("1".."6").to_a).empty? && input.length == 4
        return input
      end

      puts "Invalid input: Please try again"
    end
  end

  def to_s
    "Code Guesser"
  end
end
