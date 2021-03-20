# Write a minitest assertion that will fail if value.downcase does not return 'xyz'

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class StringTest < MiniTest::Test
  def test_string
    value = 'XYZr'
    # assert_equal('xyz', value.downcase)
    assert_equal 'xyz', value.downcase# LS: not using () for arguments.
  end
end

# assert_equal tests whether its first two arguments are equal using #== . Failure messages
# issued by #assert_equal assume that the first argument represents the expected value, 
# while the second argument represents the actual value to be tested.  It is important
# to maintain this convention so that failure messages make sense.

# student solution: note: test passes. Also, note #setup method .

class OddTest < MiniTest::Test

  def setup
    @value = 'XYZ'
  end

  def test_downcase
    assert_equal('xyz', @value.downcase)
  end
end