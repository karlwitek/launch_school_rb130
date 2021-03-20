# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.


require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class IncludeTest < MiniTest::Test
  attr_reader :list

  def setup
    @list = ['abc', 'def', 'xyz']
  end

  def test_include
    # assert_include list('xyz')# WRONG
    # assert_equal(true, list.include?('xyz'))# Good! but #assert_include is better
    assert_includes list, 'xyz'
  end
end

# assert_includes tests whether its firs argument contains the second argument.
# could of used: assert_equal true, list.include?('xyz')  instead, but
# assert_includes is clearer, better failure message.

# Note: there is 2 assertions in the test output. Review what is happening
