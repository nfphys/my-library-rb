require_relative '../lib/union_find'

require 'minitest/autorun'

class UnionFindTest < Minitest::Test 
  def test_union_find
    uf = UnionFind.new(7)
    assert_equal "{0}, {1}, {2}, {3}, {4}, {5}, {6}", uf.to_s

    uf.unite(1, 2)
    assert uf.same?(1, 2)
    assert_equal "{0}, {1, 2}, {3}, {4}, {5}, {6}", uf.to_s

    uf.unite(2, 3)
    assert uf.same?(1, 2)
    assert uf.same?(1, 3)
    assert uf.same?(2, 3)
    assert_equal "{0}, {1, 2, 3}, {4}, {5}, {6}", uf.to_s

    uf.unite(5, 6)
    assert uf.same?(5, 6)
    refute uf.same?(1, 6)
    assert_equal "{0}, {1, 2, 3}, {4}, {5, 6}", uf.to_s 

    uf.unite(1, 6)
    assert uf.same?(1, 6)
    assert_equal "{0}, {1, 2, 3, 5, 6}, {4}", uf.to_s
  end
end
