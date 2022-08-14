require_relative '../lib/avl_tree'

require 'minitest/autorun'

class AVLTreeTest < Minitest::Test 
  def test_avl_tree 
    assert AVLTree 
    assert_equal BinarySearchTree, AVLTree.superclass
  end
end