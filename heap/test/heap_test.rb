require_relative '../lib/heap'

require 'minitest/autorun'

class HeapTest < Minitest::Test 
  def test_heap 
    heap = Heap.new([5, 3, 7, 1])
    assert_equal 7, heap.top
    assert_equal [7, 3, 5, 1], heap.to_a

    assert_equal 7, heap.pop 
    assert_equal 5, heap.top 
    assert_equal [5, 3, 1], heap.to_a

    assert_equal 5, heap.pop 
    assert_equal 3, heap.top 
    assert_equal [3, 1], heap.to_a 

    assert_equal 3, heap.pop 
    assert_equal 1, heap.top 
    assert_equal [1], heap.to_a 

    assert_equal 1, heap.pop 
    assert_nil heap.top 
    assert_equal [], heap.to_a
  end
end