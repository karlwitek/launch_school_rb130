# Write a minitest assertion that will fail if the value.odd? is not true.

# Try to create class and test class in same file.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

# require_relative 'todolist_methods' # (file name)commented out because class and test
# class are in the same file.

# class MyClass
#   attr_reader :value

#   def initialize
#     @value = false
#   end
# end

# class MyClassTest < MiniTest::Test
#   def test_value
#     obj = MyClass.new
#     assert_equal(true, obj.value)
#   end
# end # this worked, see below for better solutions:

# LS / student solutions:

class OddTest < MiniTest::Test
  def test_odd
    value = 2
    assert value.odd?, 'value is not odd'
  end

  def test_odd_2
    value = 3
    #assert_equal true, value.odd?# same as assert_equal(true, value.odd?)
    assert_equal(true, value.odd?)
  end
end

# assert (by itself) tests whether its first argument is truthy(neither false or nil).
# If the first argument is not truthy, the test fails, and the second argument is 
# displayed as the failure message.  Most (but not all) of the minitest assertions let
# you specify a failure message as the final argument.  This is frequently omitted since
# error messages provided by default are usually sufficient.  The default message for
# assert lacks content, so it is common to specify the failure message when using assert.

# assert is not used directly in most tests since it is usually more important to ensure
# an exact value is returned. If you want to know that your method returns true, and not
# just a truthy value, assert_equal is a better choice.
