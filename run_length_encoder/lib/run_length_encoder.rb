require_relative 'run'

class RunLengthEncoder 
  attr_reader :runs   

  def self.encode(str)
    runs = []
    str.each_char do |c| 
      if runs.empty? 
        runs << Run.new(char: c, length: 1)
        next 
      end
      if runs.last.char == c 
        runs.last.length += 1 
      else 
        runs << Run.new(char: c, length: 1)
      end
    end
    self.new(runs)
  end

  def to_s 
    self.runs.join
  end

  def inspect 
    self.to_s 
  end

  private 

  def initialize(runs)
    @runs = runs 
  end
end