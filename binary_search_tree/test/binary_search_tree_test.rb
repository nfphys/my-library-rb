require_relative '../lib/binary_search_tree'

require 'minitest/autorun'

class BinarySearchTreeTest < Minitest::Test 
  def test_empty? 
    bst = BinarySearchTree.new([])
    assert bst.empty? 

    bst = BinarySearchTree.new([1, 3, 2])
    refute bst.empty?
  end

  def test_insert_case1
    bst = BinarySearchTree.new([7, 12, 2, 5, 2, 8, 3, 6, 15, 11, 9])
    assert_equal [7, 2, 2, 5, 3, 6, 12, 8, 11, 9, 15], bst.to_preorder.map(&:key)
  end

  def test_insert_case2 
    bst = BinarySearchTree.new([1, 2, 3, 1, 4, 5, 6])
    assert_equal [1, 1, 2, 3, 4, 5, 6], bst.to_preorder.map(&:key)
  end

  def test_left_rotation_case1
    bst = BinarySearchTree.new([])
    bst.left_rotation(bst.root)
    assert_equal [], bst.to_preorder
  end

  def test_left_rotation_case2 
    bst = BinarySearchTree.new([1])
    bst.left_rotation(bst.root)
    assert_equal [1], bst.to_preorder.map(&:key)
    # assert_equal [0], bst.to_preorder.map(&:height)
  end

  def test_left_rotation_case3 
    bst = BinarySearchTree.new([1, 2])
    bst.left_rotation(bst.root)
    assert_equal [2, 1], bst.to_preorder.map(&:key)
    # assert_equal [1, 0], bst.to_preorder.map(&:height)
  end

  def test_left_rotation_case4 
    bst = BinarySearchTree.new([100, 50, 200, 120])
    bst.left_rotation(bst.root)
    assert_equal [200, 100, 50, 120], bst.to_preorder.map(&:key)
    # assert_equal [2, 1, 0, 0], bst.to_preorder.map(&:height)
    bst.left_rotation(bst.root.left)
    assert_equal [200, 120, 100, 50], bst.to_preorder.map(&:key)
    # assert_equal [3, 2, 1, 0], bst.to_preorder.map(&:height)
  end

  def test_right_rotation_case1 
    bst = BinarySearchTree.new([])
    bst.right_rotation(bst.root)
    assert_equal [], bst.to_preorder
  end

  def test_right_rotation_case2 
    bst = BinarySearchTree.new([1])
    bst.right_rotation(bst.root)
    assert_equal [1], bst.to_preorder.map(&:key)
    # assert_equal [0], bst.to_preorder.map(&:height)
  end

  def test_right_rotation_case3 
    bst = BinarySearchTree.new([2, 1])
    bst.right_rotation(bst.root)
    assert_equal [1, 2], bst.to_preorder.map(&:key)
    # assert_equal [1, 0], bst.to_preorder.map(&:height)
  end

  def test_right_rotation_case4 
    bst = BinarySearchTree.new([100, 50, 200, 120])
    bst.right_rotation(bst.root)
    assert_equal [50, 100, 200, 120], bst.to_preorder.map(&:key)
    # assert_equal [3, 2, 1, 0], bst.to_preorder.map(&:height)
    bst.right_rotation(bst.root.right.right)
    assert_equal [50, 100, 120, 200], bst.to_preorder.map(&:key)
    # assert_equal [3, 2, 1, 0], bst.to_preorder.map(&:height)
  end

  def test_find_case1
    bst = BinarySearchTree.new 
    assert_nil bst.find(1)
  end

  def test_find_case2
    bst = BinarySearchTree.new([1])
    assert_equal bst.root, bst.find(1)
    assert_nil bst.find(2)
  end

  def test_find_case3
    bst = BinarySearchTree.new([100, 50, 200, 120])
    assert_equal bst.root, bst.find(100)
    assert_equal bst.root.right.left, bst.find(120)
  end

  def test_min_case1 
    bst = BinarySearchTree.new
    assert_nil bst.min 
  end

  def test_min_case2 
    bst = BinarySearchTree.new([1])
    assert_equal 1, bst.min.key
  end

  def test_min_case3 
    bst = BinarySearchTree.new([100, 50, 200, 120])
    assert_equal 50, bst.min.key
  end

  def test_max_case1 
    bst = BinarySearchTree.new 
    assert_nil bst.max 
  end

  def test_max_case2 
    bst = BinarySearchTree.new([1])
    assert_equal 1, bst.max.key 
  end

  def test_max_case3 
    bst = BinarySearchTree.new([100, 50, 200, 120])
    assert_equal 200, bst.max.key
  end

  def test_successor 
    bst = BinarySearchTree.new([15, 6, 18, 3, 7, 17, 20, 2, 4, 13, 9])
    assert_equal 17, bst.successor(bst.root).key
    assert_equal 15, bst.successor(bst.root.left.right.right).key 
  end

  def test_predecessor 
    bst = BinarySearchTree.new([15, 6, 18, 3, 7, 17, 20, 2, 4, 13, 9])
    assert_equal 13, bst.predecessor(bst.root).key
    assert_equal 15, bst.predecessor(bst.root.right.left).key
  end

  def test_lower_bound_case1
    bst = BinarySearchTree.new 
    assert_nil bst.lower_bound(1)
  end

  def test_lower_bound_case2
    bst = BinarySearchTree.new([1])
    assert_equal bst.root, bst.lower_bound(1)
    assert_equal bst.root, bst.lower_bound(0)
    assert_nil bst.lower_bound(2)
  end
    
  def test_lower_bound_case3
    bst = BinarySearchTree.new([100, 50, 200, 120])
    assert_equal bst.root, bst.lower_bound(90)
    assert_equal bst.root.left, bst.lower_bound(49)
    assert_equal bst.root.right.left, bst.lower_bound(115)
    assert_nil bst.lower_bound(220)
  end

  def test_delete_case1
    bst = BinarySearchTree.new 
    refute bst.delete(1)
    assert_equal [], bst.to_preorder
  end

  def test_delete_case2
    bst = BinarySearchTree.new([1])
    refute bst.delete(100)
    assert bst.delete(1)
    assert_equal [], bst.to_preorder
  end

  def test_delete_case3
    bst = BinarySearchTree.new([2, 1])
    assert bst.delete(2)
    assert_equal [1], bst.to_preorder.map(&:key)
    assert bst.delete(1)
    assert_equal [], bst.to_preorder.map(&:key)
  end

  def test_delete_case4
    bst = BinarySearchTree.new([1, 2])
    assert bst.delete(1)
    assert_equal [2], bst.to_preorder.map(&:key)
    assert bst.delete(2)
    assert_equal [], bst.to_preorder.map(&:key)
  end

  def test_delete_case5
    bst = BinarySearchTree.new([100, 50, 200, 120])
    assert bst.delete(100)
    assert_equal [120, 50, 200], bst.to_preorder.map(&:key)
  end

  def test_delete_case6
    bst = BinarySearchTree.new([7, 12, 2, 5, 2, 8, 3, 6, 15, 11, 9])
    assert bst.delete(7)
    assert_equal [8, 2, 2, 5, 3, 6, 12, 11, 9, 15], bst.to_preorder.map(&:key)
    assert bst.delete(12)
    assert_equal [8, 2, 2, 5, 3, 6, 15, 11, 9], bst.to_preorder.map(&:key)
    assert bst.delete(2)
    assert_equal [8, 3, 2, 5, 6, 15, 11, 9], bst.to_preorder.map(&:key)
  end

  def test_height_case1 
    bst = BinarySearchTree.new([1])
    assert_equal [0], bst.to_preorder.map(&:height)
  end

  def test_height_case2 
    bst = BinarySearchTree.new([7, 12, 2, 5, 2, 8, 3, 6, 15, 11, 9])
    assert_equal [4, 2, 0, 1, 0, 0, 3, 2, 1, 0, 0], bst.to_preorder.map(&:height)
    assert bst.delete(7)
    assert_equal [3, 2, 0, 1, 0, 0, 2, 1, 0, 0], bst.to_preorder.map(&:height)
  end

  def test_balance_factor_case1
    bst = BinarySearchTree.new([1])
    assert_equal [0], bst.to_preorder.map(&:balance_factor)
  end

  def test_balance_factor_case2 
    bst = BinarySearchTree.new([1, 2, 3])
    assert_equal [1, 0, 0], bst.to_preorder.map(&:balance_factor)
  end

  def test_balance_factor_case3 
    bst = BinarySearchTree.new([7, 12, 2, 5, 2, 8, 3, 6, 15, 11, 9])
    assert_equal [1, 1, 0, 0, 0, 0, -2, 1, 0, 0, 0], bst.to_preorder.map(&:balance_factor)
  end
end