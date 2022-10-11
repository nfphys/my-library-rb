require_relative '../lib/euclidean_algorithm'
require 'minitest/autorun'

class EuclideanAlgorithmTest < Minitest::Test 
  include EuclideanAlgorithm 

  def test_gcd
    100.times do 
      a = rand(-100..100)
      b = rand(-100..100)
      assert_equal a.gcd(b), gcd(a, b)
    end
  end

  def test_solve_bezout 
    100.times do 
      a = rand(-100..100)
      b = rand(-100..100)
      x, y = solve_bezout(a, b)
      assert_equal a.gcd(b), a*x + b*y
    end
  end
end