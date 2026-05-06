require_relative "player"

class CodeMaker < Player
  def generateCode
    Array.new(4) { rand(1..6) }
  end

  def to_s
    "Code Maker"
  end
end
