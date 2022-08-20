require_relative '../lib/quasi_ordered_map'

require 'minitest/autorun'

class QuasiOrderedMapTest < Minitest::Test 
  def test_quasi_ordered_map 
    assert QuasiOrderedMap
  end

  def test_initialize 
    assert QuasiOrderedMap.new
  end

  def test_add_key_value_pair 
    map = QuasiOrderedMap.new 

    assert_nil map[1]
    map[1] = "hoge"
    assert_equal "hoge", map[1]

    assert_nil map[3]
    map[3] = "fuga"
    assert_equal "fuga", map[3]
  end

  def test_from_hash 
    hash = {
      1 => "hoge", 
      3 => "fuga",
    }
    map = QuasiOrderedMap.from_hash(hash)
    assert_equal "hoge", map[1]
    assert_equal "fuga", map[3]
  end

  def test_has_key 
    hash = {
      1 => "hoge", 
      3 => "fuga",
    }
    map = QuasiOrderedMap.from_hash(hash)
    assert map.has_key?(1)
    assert map.has_key?(3)
    refute map.has_key?(10)
  end

  def test_delete 
    hash = {
      1 => "hoge", 
      3 => "fuga",
    }
    map = QuasiOrderedMap.from_hash(hash)
    assert map.has_key?(1)
    map.delete(1)
    refute map.has_key?(1)
  end

  def test_lower_bound 
    hash = {
      100 => "a", 
      25  => "b",
      70  => "c",
      210 => "d",
      107 => "e",
    }
    map = QuasiOrderedMap.from_hash(hash)
    assert_equal 107, map.lower_bound(105)
    assert_equal "e", map[107]
    assert_equal  70, map.lower_bound(52)
    assert_equal "c", map[70]
  end
end