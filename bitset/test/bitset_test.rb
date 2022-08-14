require_relative '../lib/bitset'

require 'minitest/autorun'

class BitSetTest < Minitest::Test 
  def test_bitset 
    assert BitSet 
  end

  def test_to_s 
    bitset = BitSet.new(0b101)
    assert_equal "101", bitset.to_s
  end

  def test_to_i 
    bitset = BitSet.new(3)
    assert_equal 3, bitset.to_i

    bitset = BitSet.new(10)
    assert_equal 10, bitset.to_i
  end

  def test_indexing 
    bitset = BitSet.new(0b1011)
    assert_equal 1, bitset[0]
    assert_equal 1, bitset[1]
    assert_equal 0, bitset[2]
    assert_equal 1, bitset[3]

    bitset[1] = 0
    assert_equal 0b1001, bitset.to_i 
    bitset[2] = 1
    assert_equal 0b1101, bitset.to_i
  end
end