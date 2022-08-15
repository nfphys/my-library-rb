require_relative 'node'

class BinarySearchTree
  attr_reader :root 

  def root=(node)
    @root = node 
    node.parent = nil if node 
  end

  def initialize(ary=[])
    if ary.empty? 
      self.root = nil
      return 
    end

    ary.each do |value|
      self.insert(value)
    end
  end

  # valueを値に持つノードを挿入
  def insert(value)
    inserted_node = Node.new(value: value)
    if root.nil?
      self.root = inserted_node 
      return 
    end

    next_node = self.root 
    current_node = nil
    while next_node 
      current_node = next_node 

      if inserted_node.value <= current_node.value 
        next_node = current_node.left 
      else
        next_node = current_node.right 
      end
    end

    if inserted_node.value <= current_node.value
      current_node.left = inserted_node 
    else
      current_node.right = inserted_node 
    end

    update_height(current_node)

    nil
  end

  # valueを値に持つノードを検索
  def find(value)
    return if self.root.nil? 

    next_node = self.root 
    current_node = nil 
    while next_node 
      current_node = next_node 
      if value < current_node.value 
        next_node = current_node.left 
        next 
      end

      if value > current_node.value  
        next_node = current_node.right 
        next 
      end

      return current_node 
    end

    nil
  end

  # valueを値に持つノードを一つ削除
  def delete(value)
    node = self.find(value)
    return false if node.nil? 

    if node.left && node.right
      successor = find_successor(node)
      successor_value = successor.value 
      delete(successor_value)
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

    update_height(parent)

    true
  end

  # value以上の最小の値を持つノードを検索
  def lower_bound(value)
    return if self.root.nil? 

    next_node = self.root 
    current_node = nil 
    while next_node 
      current_node = next_node 
      if value > current_node.value 
        next_node = current_node.right 
        next 
      end

      if current_node.left && value <= current_node.left.value 
        next_node = current_node.left 
        next 
      end

      return current_node 
    end

    nil 
  end

  # nodeを根とする部分木を左回転
  def left_rotation(node)
    return if node.nil?

    parent = node.parent
    pivot  = node.right 
    return if pivot.nil? 

    node.right = pivot.left
    pivot.left = node  

    if parent.nil? 
      self.root = pivot 
      update_height(node)
      return 
    end

    if parent.left == node
      parent.left  = pivot 
    else 
      parent.right = pivot
    end
    # update_height(node)
  end

  # nodeを根とする部分木を右回転
  def right_rotation(node)
    return if node.nil? 

    parent = node.parent 
    pivot  = node.left
    return if pivot.nil? 

    node.left = pivot.right 
    pivot.right = node 

    if parent.nil? 
      self.root = pivot 
      update_height(node)
      return 
    end

    if parent.left == node 
      parent.left  = pivot 
    else 
      parent.right = pivot 
    end
    # update_height(node)
  end

  # rootから出発して、二分探索木の各ノードを行きがけ順に並べる
  def to_preorder 
    return [] if self.root.nil? 
    preorder = []
    self._to_preorder(self.root, preorder)
    preorder
  end

  private 

  # to_preorderの補助メソッド
  def _to_preorder(node, preorder)
    preorder << node
    self._to_preorder(node.left,  preorder) if node.left 
    self._to_preorder(node.right, preorder) if node.right 
  end

  # 通りがけ順でnodeの次のノードを見つける
  def find_successor(node)
    next_node = node.right 
    current_node = nil 
    while next_node 
      current_node = next_node 
      if current_node.left 
        next_node = current_node.left
        next 
      end
      break  
    end
    current_node
  end

  # rootからnodeへのパス上のノードの高さを更新
  def update_height(node)
    next_node = node 
    current_node = nil 
    while next_node 
      current_node = next_node
      current_node.update_height 
      next_node = current_node.parent 
    end 
  end
end