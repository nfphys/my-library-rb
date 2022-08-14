class Heap 

  private 
  
  attr_reader :ary  

  public 

  def initialize(ary = [])
    @ary = []
    ary.each do |a| 
      self.push(a)
    end    
  end

  def push(x)
    ary << x
    i = ary.size - 1
    while i > 0 
      parent = (i - 1) / 2 
      break if ary[parent] >= x 
      ary[i] = ary[parent]
      i = parent 
    end
    ary[i] = x
  end

  def top 
    return if ary.empty? 
    ary.first
  end

  def pop 
    return if ary.empty? 

    top = self.top 
    x = ary.pop
    return top if ary.empty? 
    
    i = 0
    while i * 2 + 1 < ary.size 
      # 子頂点同士を比較して大きい方を child1 とする
      child1 = i * 2 + 1
      child2 = i * 2 + 2
      if child2 < ary.size && ary[child2] > ary[child1] 
        child1 = child2 
      end

      break if ary[child1] <= x

      ary[i] = ary[child1]
      i = child1
    end
    ary[i] = x

    top
  end

  def size 
    ary.size 
  end

  def to_a 
    ary
  end

  def to_s 
    ary.to_s 
  end

  def inspect 
    ary.inspect
  end
end
