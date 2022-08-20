require_relative '../lib/quasi_multiset'

require 'minitest/autorun'

class QuasiMultiSetTest < Minitest::Test 
  def test_multi_set
    assert QuasiMultiSet 
  end

  def test_empty_for_empty_multiset
    multiset = QuasiMultiSet.new 
    assert multiset.empty? 
  end

  def test_empty_for_non_empty_multiset
    multiset = QuasiMultiSet.new([1, 2, 2])
    refute multiset.empty?
  end

  def test_count
    multiset = QuasiMultiSet.new([1, 2, 2, 3, 3, 3])
    assert_equal 1, multiset.count(1)
    assert_equal 2, multiset.count(2)
    assert_equal 3, multiset.count(3)
  end

  def test_max_for_empty_multiset
    multiset = QuasiMultiSet.new 
    assert_nil multiset.max 
  end

  def test_max 
    multiset = QuasiMultiSet.new([1, 2, 3, 3, 5, 5, 5, 6])
    assert_equal 6, multiset.max 
  end

  def test_min_for_empty_multiset
    multiset = QuasiMultiSet.new 
    assert_nil multiset.min
  end

  def test_min
    multiset = QuasiMultiSet.new([1, 2, 3, 3, 5, 5, 5, 6])
    assert_equal 1, multiset.min
  end

  def test_insert 
    multiset = QuasiMultiSet.new([1, 2, 2, 3, 3, 3])
    multiset.insert(2)
    assert_equal 3, multiset.count(2)
    multiset.insert(5)
    assert_equal 1, multiset.count(5)
  end

  def test_delete 
    multiset = QuasiMultiSet.new([1, 2, 2, 3, 3, 3])
    multiset.delete(3, 1)
    assert_equal 2, multiset.count(3)
    multiset.delete(2, 10)
    assert_equal 0, multiset.count(2)
  end

  def test_lower_bound 
    multiset = QuasiMultiSet.new([100, 25, 70, 210, 107])
    assert_equal 107, multiset.lower_bound(105)
    assert_equal 70, multiset.lower_bound(52)
  end
end