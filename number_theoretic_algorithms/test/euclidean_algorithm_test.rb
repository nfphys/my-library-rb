require_relative '../lib/euclidean_algorithm'
require 'minitest/autorun'

class EuclideanAlgorithmTest < Minitest::Test 
  include EuclideanAlgorithm 

  def test_gcd
    assert_equal 1, gcd(2, 3)
    assert_equal 3, gcd(6, 9)
    assert_equal 2, gcd(32, 18)
  end
end