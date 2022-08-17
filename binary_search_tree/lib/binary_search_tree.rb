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

    ary.each do |key|
      self.insert(key)
    end
  end

  # 指定されたキーを持つノードを挿入
  def insert(key)
    inserted_node = Node.new(key: key)
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

    update_height(current_node)

    nil
  end

  # 指定されたキーを持つノードを検索
  def find(key)
    return if self.root.nil? 

    next_node = self.root 
    current_node = nil 
    while next_node 
      current_node = next_node 
      if key < current_node.key  
        next_node = current_node.left 
        next 
      end

      if key > current_node.key 
        next_node = current_node.right 
        next 
      end

      return current_node 
    end

    nil
  end

  # nodeを根とする部分木において、最小のキーを持つノードを検索
  def min(node=self.root)
    return if node.nil? 
    min_node = node 
    while min_node.left 
      min_node = min_node.left 
    end
    min_node 
  end

  # nodeを根とする部分木において、最大のキーを持つノードを検索
  def max(node=self.root)
    return if node.nil? 
    max_node = node
    while max_node.right 
      max_node = max_node.right 
    end
    max_node 
  end

  # 通りがけ順でnodeの次のノードを見つける
  def successor(node)
    return if node.nil? 
    
    if node.right 
      return self.min(node.right)
    end

    leftmost_ancestor(node).parent 
  end

  # 通りがけ順でnodeの前のノードを見つける
  def predecessor(node)
    return if node.nil? 

    if node.left 
      return self.max(node.left)
    end

    rightmost_ancestor(node).parent 
  end

  # nodeの祖先のうち、最も左側にあるノード
  def leftmost_ancestor(node)
    next_node = node.parent 
    current_node = node 
    while next_node && next_node.right == current_node 
      current_node = next_node 
      next_node = current_node.parent 
    end
    current_node 
  end

  # nodeの祖先のうち、最も右側にあるノード
  def rightmost_ancestor(node)
    next_node = node.parent 
    current_node = node 
    while next_node && next_node.left == current_node 
      current_node = next_node 
      next_node = current_node.parent 
    end
    current_node 
  end

  # 指定されたキーを持つノードを一つ削除
  def delete(key)
    node = self.find(key)
    return false if node.nil? 

    if node.left && node.right
      successor = self.successor(node)
      successor_key = successor.key 
      delete(successor_key)
      node.key = successor_key
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

  # key以上の最小のキーを持つノードを検索
  def lower_bound(key)
    return if self.root.nil? 

    next_node = self.root 
    current_node = nil 
    while next_node 
      current_node = next_node 
      if key > current_node.key 
        next_node = current_node.right 
        next 
      end

      if current_node.left && key <= current_node.left.key 
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
      return 
    end

    if parent.left == node
      parent.left  = pivot 
    else 
      parent.right = pivot
    end
    
    node.update_height
    pivot.update_height
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
      return 
    end

    if parent.left == node 
      parent.left  = pivot 
    else 
      parent.right = pivot 
    end
    
    node.update_height
    pivot.update_height
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