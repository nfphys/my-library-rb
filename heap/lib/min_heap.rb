require_relative 'heap_base'

class MinHeap < Heap::Base 
  attr_reader :ary 
  
  def push(x)
    ary << x
    node = ary.size - 1
    while node > 0 
      parent = self.parent(node)
      break if ary[parent] <= x 
      ary[node] = ary[parent]
      node = parent 
    end
    ary[node] = x 
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

      smaller_child = left_child
      if right_child < ary.size && ary[right_child] < ary[left_child] 
        smaller_child = right_child
      end

      break if ary[smaller_child] >= x 

      ary[node] = ary[smaller_child]
      node = smaller_child 
    end
    ary[node] = x

    top
  end
end