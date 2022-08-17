require_relative 'binary_search_tree'

class AVLTree < BinarySearchTree 
  # 指定されたキーを持つノードを挿入
  def insert(key, value=nil)
    inserted_node = Node.new(key: key, value: value)
    if root.nil?
      self.root = inserted_node 
      return 
    end

    next_node = self.root 
    current_node = nil
    while next_node 
      current_node = next_node 

      if inserted_node.key <= current_node.key 
        next_node = current_node.left 
      else
        next_node = current_node.right 
      end
    end

    if inserted_node.key <= current_node.key 
      current_node.left = inserted_node 
    else
      current_node.right = inserted_node 
    end

    balance_height(current_node)

    nil
  end

  def delete(key)
    node = self.find(key)
    return false if node.nil? 

    if node.left && node.right
      successor = self.successor(node)
      successor_key   = successor.key 
      successor_value = successor.value 
      delete(successor_key)
      node.key   = successor_key
      node.value = successor_value 
      return true 
    end

    parent = node.parent 

    child = nil 
    if node.left 
      child = node.left 
    elsif node.right 
      child = node.right 
    end

    if parent.nil? 
      self.root = child 
      node.destroy 
      return true 
    end

    if parent.left == node 
      parent.left  = child 
    else 
      parent.right = child 
    end
    node.destroy 

    balance_height(parent)

    true
  end

  def balanced?(node=self.root)
    return true if node.nil? 

    right_balanced = self.balanced?(node.right)
    return false unless right_balanced

    left_balanced  = self.balanced?(node.left)
    return false unless left_balanced

    node.update_height 

    node.balance_factor.abs <= 1
  end

  private 

  def balance_height(node)
    next_node = node 
    current_node = nil 
    while next_node 
      current_node = next_node 
      current_node.update_height 
      rotated = false

      # puts "before: #{current_node.balance_factor}"
      
      if self.require_double_left_rotation?(current_node)
        # puts "do double left rotation"
        self.right_rotation(current_node.right)
        self.left_rotation(current_node)
        rotated = true 
      elsif self.require_left_rotation?(current_node)
        # puts "do left rotation"
        self.left_rotation(current_node)
        rotated = true 
      elsif self.require_double_right_rotation?(current_node)
        # puts "do double right rotation"
        self.left_rotation(current_node.left)
        self.right_rotation(current_node)
        rotated = true 
      elsif self.require_right_rotation?(current_node)
        # puts "do right rotation"
        self.right_rotation(current_node) 
        rotated = true 
      end

      # puts "after: #{current_node.balance_factor}"
      # puts ""
      
      if rotated 
        next_node = current_node.parent.parent 
      else 
        next_node = current_node.parent 
      end
    end
  end

  def require_double_left_rotation?(node) 
    node.balance_factor > 1 && node.right.balance_factor < 0
  end

  def require_left_rotation?(node)
    node.balance_factor > 1 && node.right.balance_factor >= 0
  end

  def require_double_right_rotation?(node)
    node.balance_factor < -1 && node.left.balance_factor > 0
  end

  def require_right_rotation?(node)
    node.balance_factor < -1 && node.left.balance_factor <= 0 
  end
end