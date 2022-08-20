require_relative '../lib/prime_factorize'

require 'minitest/autorun'

class PrimeFactorizeTest < Minitest::Test 
  def test_prime_factorize 
    assert_equal [], prime_factorize(1)

    assert_equal [[2, 1]], prime_factorize(2)

    assert_equal [[2, 2], [3, 1]], prime_factorize(12)
  end
end