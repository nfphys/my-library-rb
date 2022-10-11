require_relative '../lib/euclidean_algorithm'
require 'minitest/autorun'

class EuclideanAlgorithmTest < Minitest::Test 
  include EuclideanAlgorithm 

  def test_gcd
    assert_equal 1, gcd(2, 3)
    assert_equal 3, gcd(6, 9)
    assert_equal 2, gcd(32, 18)
    assert_equal 1, gcd(3, -7)
  end

  def test_solve_bezout 
    10.times do 
      a = rand(-100..100)
      b = rand(-100..100)
      x, y = solve_bezout(a, b)
      assert_equal gcd(a, b), a*x + b*y
    end
  end
end