# Write a minites assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses
# (eg. Integer, Float, etc.)

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class TypeTest < MiniTest::Test
  def test_type
    value = 5.9
    assert_kind_of Numeric, value
  end
end