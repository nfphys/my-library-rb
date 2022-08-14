module Heap 
  class Base 
    def initialize(ary = [])
      @ary = []
      ary.each do |a| 
        self.push(a)
      end    
    end
  
    def top 
      return if ary.empty? 
      ary.first
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
end