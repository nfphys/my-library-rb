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
end