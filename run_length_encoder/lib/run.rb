class Run 
  attr_reader :char
  
  attr_accessor :length 

  def initialize(char:, length:)
    @char   = char 
    @length = length 
  end

  def to_s 
    "(#{char}, #{length})"
  end

  def inspect 
    self.to_s 
  end
end