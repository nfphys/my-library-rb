require_relative 'avl_tree'

class MultiSet 

  private 
  attr_reader :bst 
  public 

  def initialize(ary=[])
    @bst = AVLTree.new
    ary.each do |key|
      self.insert(key)
    end 
  end

  def insert(key)
    node = bst.find(key)
    if node 
      node.value += 1
    else 
      bst.insert(key, 1)
    end
  end

  def delete(key, count)
    node = bst.find(key)
    return if node.nil? 

    if node.value > count 
      node.value -= count 
    else 
      bst.delete(key)
    end
  end

  def count(key)
    node = bst.find(key)
    return 0 if node.nil? 
    node.value 
  end

  def empty? 
    bst.empty? 
  end

  def max 
    return if self.empty? 
    bst.max.key 
  end

  def min 
    return if self.empty?
    bst.min.key 
  end

  def lower_bound(key)
    node = bst.lower_bound(key)
    return if node.nil? 
    node.key 
  end
end