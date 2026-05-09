# A base class for the Code Maker that randomly generates a code
class CodeMaker
  def generate_code
    Array.new(4) { rand(1..6).to_s }
  end

  def to_s
    "Code Maker"
  end
end
