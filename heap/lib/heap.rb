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
    node = ary.size - 1
    while node > 0 
      parent = self.parent(node)
      break if ary[parent] >= x 
      ary[node] = ary[parent]
      node = parent 
    end
    ary[node] = x 
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
    
    node = 0
    while left_child(node) < ary.size 
      left_child  = self.left_child(node)
      right_child = self.right_child(node)

      larger_child = left_child
      if right_child < ary.size && ary[right_child] > ary[left_child] 
        larger_child = right_child
      end

      break if ary[larger_child] <= x 

      ary[node] = ary[larger_child]
      node = larger_child 
    end
    ary[node] = x

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

  private 

  def parent(node)
    (node - 1) / 2 
  end

  def left_child(node)
    2 * node + 1
  end

  def right_child(node)
    2 * node + 2 
  end
end
