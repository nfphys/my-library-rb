require_relative '../lib/binary_indexed_tree'

require 'minitest/autorun'

class BinaryIndexedTreeTest < Minitest::Test 
  def test_binary_indexed_tree
    assert BinaryIndexedTree
  end

  def test_initialize 
    bit = BinaryIndexedTree.new(4, 2)
    assert_equal [2, 2, 2, 2], bit.to_a
  end

  def test_add
    bit = BinaryIndexedTree.new(4)
    bit.add(0, 2)
    assert_equal [2, 0, 0, 0], bit.to_a
    bit.add(1, 3)
    assert_equal [2, 3, 0, 0], bit.to_a
    bit.add(2, 1)
    assert_equal [2, 3, 1, 0], bit.to_a 
    bit.add(3, 5)
    assert_equal [2, 3, 1, 5], bit.to_a
  end

  def test_sum 
    bit = BinaryIndexedTree.new(5, 0)
    bit.add(1, 5)
    bit.add(2, 2)
    bit.add(3, 7)
    bit.add(4, 1)
    assert_equal [0, 5, 2, 7, 1], bit.to_a
    assert_equal 0,  bit.sum(1)
    assert_equal 5,  bit.sum(2)
    assert_equal 7,  bit.sum(3)
    assert_equal 14, bit.sum(4)
    assert_equal 15, bit.sum(5)
  end
end