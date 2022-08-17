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

  def test_delete_case1
    bst = AVLTree.new 
    refute bst.delete(1)
    assert bst.balanced?
  end

  def test_delete_case2
    bst = AVLTree.new([1])
    refute bst.delete(100)
    assert bst.delete(1)
    assert bst.balanced?
  end

  def test_delete_case3
    bst = AVLTree.new([2, 1])
    assert bst.delete(2)
    assert bst.balanced?
    assert bst.delete(1)
    assert bst.balanced?
  end

  def test_delete_case4
    bst = AVLTree.new([1, 2])
    assert bst.delete(1)
    assert bst.balanced?
    assert bst.delete(2)
    assert bst.balanced?
  end

  def test_delete_case5
    bst = AVLTree.new([100, 50, 200, 120])
    assert bst.delete(100)
    assert bst.balanced?
  end

  def test_delete_case6
    bst = AVLTree.new([7, 12, 2, 5, 2, 8, 3, 6, 15, 11, 9])
    assert bst.delete(7)
    assert bst.balanced?
    assert bst.delete(12)
    assert bst.balanced?
    assert bst.delete(2)
    assert bst.balanced?
  end
    
end