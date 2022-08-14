require_relative '../use_cases/inversion_number'

require 'minitest/autorun'

class InversionNumberTest < Minitest::Test 
  def test_inversion_number 
    assert_equal 0, calc_inversion_number([1, 2, 3])
    assert_equal 1, calc_inversion_number([2, 1, 3])
    assert_equal 3, calc_inversion_number([3, 2, 1])
    assert_equal 5, calc_inversion_number([4, 3, 1, 2])
  end
end