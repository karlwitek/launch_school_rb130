# Write a minitest assertion that will fail if value is not an instance of the
# Numeric class exactly. value may not be an instance of one of Numeric's 
# superclasses.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class InstanceTest < MiniTest::Test
  def test_instance
    value = Numeric.new
    assert_instance_of Numeric, value
  end
end
