require_relative 'avl_tree'

class OrderedMap 

  private 
  attr_reader :bst 
  public 

  def initialize
    bst = AVLTree.new 
  end
end