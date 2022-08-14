class BitSet 
  
  def initialize(n)
    @integer = n
  end

  def [](i)
    if (@integer >> i) & 1 == 1 
      return 1 
    else 
      return 0 
    end
  end

  def []=(i, bit)
    if bit == 0
      @integer = @integer & ~(1 << i)
    else 
      @integer |= (1 << i)
    end
  end

  def to_i 
    @integer 
  end

  def to_s 
    @integer.to_s(2)
  end

  def inspect 
    to_s 
  end
end