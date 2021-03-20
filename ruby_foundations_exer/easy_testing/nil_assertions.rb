# Write a minitest that will fail if value is not nil.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class NilTest < MiniTest::Test
  def setup
    @value = 3
  end

  def test_nil
    #assert_equal nil, @value# note: just @value , not @value.nil? this returns t/f
    assert_nil @value# LS solution (assert_nil)
  end
end

# #assert_nil tests whether its first argument is nil.
# could of used assert_equal nil, value  instead, but #assert_nil is clearer and issues
# a better failure message. 'Expected 3 to be nil'


