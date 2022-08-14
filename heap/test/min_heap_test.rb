require_relative '../lib/min_heap'

require 'minitest/autorun'

class MinHeapTest < Minitest::Test 
  def test_min_heap 
    heap = MinHeap.new([5, 3, 7, 1])
    assert_equal 1, heap.top

    assert_equal 1, heap.pop 
    assert_equal 3, heap.top 

    assert_equal 3, heap.pop 
    assert_equal 5, heap.top 

    assert_equal 5, heap.pop 
    assert_equal 7, heap.top 

    assert_equal 7, heap.pop 
    assert_nil heap.top 
  end
end