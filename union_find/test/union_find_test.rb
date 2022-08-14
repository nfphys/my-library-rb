require_relative '../lib/union_find'

require 'minitest/autorun'

class UnionFindTest < Minitest::Test 
  def test_union_find
    uf = UnionFind.new(7)
    assert_equal "{0}, {1}, {2}, {3}, {4}, {5}, {6}", uf.to_s
    assert_equal 1, uf.size(0)
    assert_equal 1, uf.size(1)
    assert_equal 1, uf.size(2)
    assert_equal 1, uf.size(3)
    assert_equal 1, uf.size(4)
    assert_equal 1, uf.size(5)
    assert_equal 1, uf.size(6)

    uf.unite(1, 2)
    assert uf.same?(1, 2)
    assert_equal "{0}, {1, 2}, {3}, {4}, {5}, {6}", uf.to_s
    assert_equal 1, uf.size(0)
    assert_equal 2, uf.size(1)
    assert_equal 2, uf.size(2)
    assert_equal 1, uf.size(3)
    assert_equal 1, uf.size(4)
    assert_equal 1, uf.size(5)
    assert_equal 1, uf.size(6)

    uf.unite(2, 3)
    assert uf.same?(1, 2)
    assert uf.same?(1, 3)
    assert uf.same?(2, 3)
    assert_equal "{0}, {1, 2, 3}, {4}, {5}, {6}", uf.to_s
    assert_equal 1, uf.size(0)
    assert_equal 3, uf.size(1)
    assert_equal 3, uf.size(2)
    assert_equal 3, uf.size(3)
    assert_equal 1, uf.size(4)
    assert_equal 1, uf.size(5)
    assert_equal 1, uf.size(6)

    uf.unite(5, 6)
    assert uf.same?(5, 6)
    refute uf.same?(1, 6)
    assert_equal "{0}, {1, 2, 3}, {4}, {5, 6}", uf.to_s 
    assert_equal 1, uf.size(0)
    assert_equal 3, uf.size(1)
    assert_equal 3, uf.size(2)
    assert_equal 3, uf.size(3)
    assert_equal 1, uf.size(4)
    assert_equal 2, uf.size(5)
    assert_equal 2, uf.size(6)

    uf.unite(1, 6)
    assert uf.same?(1, 6)
    assert_equal "{0}, {1, 2, 3, 5, 6}, {4}", uf.to_s
    assert_equal 1, uf.size(0)
    assert_equal 5, uf.size(1)
    assert_equal 5, uf.size(2)
    assert_equal 5, uf.size(3)
    assert_equal 1, uf.size(4)
    assert_equal 5, uf.size(5)
    assert_equal 5, uf.size(6)
  end
end
