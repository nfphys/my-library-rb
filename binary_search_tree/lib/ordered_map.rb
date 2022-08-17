require_relative 'avl_tree'

class OrderedMap 

  private 
  attr_reader :bst 
  public 

  def initialize()
    @bst = AVLTree.new
  end

  def [](key)
    node = self.bst.find(key)
    return if node.nil? 
    node.value 
  end

  def []=(key, value)
    node = self.bst.find(key)
    if node 
      node.value = value 
    else 
      bst.insert(key, value)
    end
  end
end