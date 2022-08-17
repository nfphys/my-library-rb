require_relative 'avl_tree'

class OrderedMap 

  def self.from_hash(hash)
    ordered_map = self.new 
    hash.each do |key, value|
      ordered_map[key] = value 
    end
    ordered_map
  end

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

  def has_key?(key)
    !!self.bst.find(key)
  end
end