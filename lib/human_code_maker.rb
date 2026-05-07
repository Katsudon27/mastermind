require_relative "code_maker"

class HumanCodeMaker < CodeMaker
  def generateCode
    loop do
      puts "Create a 4-colour secret code by typing in the corresponding numbers as your guess:"
      input = gets.chomp.to_s.split("")

      if (input - ("1".."6").to_a).empty? && input.length == 4
        return input
      end

      puts "Invalid input: Please try again"
    end
  end
end
