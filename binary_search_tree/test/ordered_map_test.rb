require_relative '../lib/ordered_map'

require 'minitest/autorun'

class OrderedMapTest < Minitest::Test 
  def test_ordered_map 
    assert OrderedMap
  end
end