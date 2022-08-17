require_relative '../lib/avl_tree'

require 'minitest/autorun'

class AVLTreeTest < Minitest::Test 
  def test_avl_tree 
    assert AVLTree 
    assert_equal BinarySearchTree, AVLTree.superclass
  end

  def test_insert_case1
    bst = AVLTree.new([7, 12, 2, 5, 2, 8, 3, 6, 15, 11, 9])
    assert bst.balanced?
  end

  def test_insert_case2 
    bst = AVLTree.new([1, 2, 3, 1, 4, 5, 6])
    assert bst.balanced?
  end
    
end