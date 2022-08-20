require_relative '../lib/run_length_encoder'

require 'minitest/autorun'

class RunLengthEncoderTest < Minitest::Test 
  def test_run_length_encoder
    assert RunLengthEncoder
  end

  def test_encode 
    encoder = RunLengthEncoder.encode('abbccc')
    assert_equal '(a, 1)(b, 2)(c, 3)', encoder.to_s 

    encoder = RunLengthEncoder.encode('sdsssyyz')
    assert_equal '(s, 1)(d, 1)(s, 3)(y, 2)(z, 1)', encoder.to_s
  end
end