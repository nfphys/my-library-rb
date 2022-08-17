require_relative '../lib/multiset'

require 'minitest/autorun'

class MultiSetTest < Minitest::Test 
  def test_multi_set
    assert MultiSet 
  end

  def test_count
    multiset = MultiSet.new([1, 2, 2, 3, 3, 3])
    assert_equal 1, multiset.count(1)
    assert_equal 2, multiset.count(2)
    assert_equal 3, multiset.count(3)
  end

  def test_max 
    multiset = MultiSet.new([1, 2, 3, 3, 5, 5, 5, 6])
    assert_equal 6, multiset.max 
  end

  def test_min
    multiset = MultiSet.new([1, 2, 3, 3, 5, 5, 5, 6])
    assert_equal 1, multiset.min
  end

  def test_insert 
    multiset = MultiSet.new([1, 2, 2, 3, 3, 3])
    multiset.insert(2)
    assert_equal 3, multiset.count(2)
    multiset.insert(5)
    assert_equal 1, multiset.count(5)
  end

  def test_delete 
    multiset = MultiSet.new([1, 2, 2, 3, 3, 3])
    multiset.delete(3, 1)
    assert_equal 2, multiset.count(3)
    multiset.delete(2, 10)
    assert_equal 0, multiset.count(2)
  end
end