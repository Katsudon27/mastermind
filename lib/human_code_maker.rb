require_relative "code_maker"

class HumanCodeMaker < CodeMaker
  def generate_code
    loop do
      puts "Create a 4-colour secret code by typing in the corresponding numbers as your guess:"
      input = gets.chomp.to_s.chars

      return input if (input - ("1".."6").to_a).empty? && input.length == 4

      puts "Invalid input: Please try again"
    end
  end
end
