require_relative '../lib/ordered_map'

require 'minitest/autorun'

class OrderedMapTest < Minitest::Test 
  def test_ordered_map 
    assert OrderedMap 
  end

  def test_initialize 
    assert OrderedMap.new
  end

  def test_add_key_value_pair 
    ordered_map = OrderedMap.new 

    assert_nil ordered_map[1]
    ordered_map[1] = "hoge"
    assert_equal "hoge", ordered_map[1]

    assert_nil ordered_map[3]
    ordered_map[3] = "fuga"
    assert_equal "fuga", ordered_map[3]
  end

  def test_from_hash 
    hash = {
      1 => "hoge", 
      3 => "fuga",
    }
    ordered_map = OrderedMap.from_hash(hash)
    assert_equal "hoge", ordered_map[1]
    assert_equal "fuga", ordered_map[3]
  end

  def test_has_key 
    hash = {
      1 => "hoge", 
      3 => "fuga",
    }
    ordered_map = OrderedMap.from_hash(hash)
    assert ordered_map.has_key?(1)
    assert ordered_map.has_key?(3)
    refute ordered_map.has_key?(10)
  end

  def test_delete 
    hash = {
      1 => "hoge", 
      3 => "fuga",
    }
    ordered_map = OrderedMap.from_hash(hash)
    assert ordered_map.has_key?(1)
    ordered_map.delete(1)
    refute ordered_map.has_key?(1)
  end

  def test_lower_bound 
    hash = {
      100 => "a", 
      25  => "b",
      70  => "c",
      210 => "d",
      107 => "e",
    }
    ordered_map = OrderedMap.from_hash(hash)
    assert_equal 107, ordered_map.lower_bound(105)
    assert_equal "e", ordered_map[107]
    assert_equal  70, ordered_map.lower_bound(52)
    assert_equal "c", ordered_map[70]
  end
end