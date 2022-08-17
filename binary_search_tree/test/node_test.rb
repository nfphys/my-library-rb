require_relative '../lib/node'

require 'minitest/autorun'

class NodeTest < Minitest::Test 
  def test_nil_node 
    assert Node::Nil
    assert Node::Nil.color == :black 
  end
end