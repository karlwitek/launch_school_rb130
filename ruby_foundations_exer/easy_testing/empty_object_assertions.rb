# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class ListTest < MiniTest::Test
  def setup
    @array = ['a', 'b']
  end

  def test_empty
    # assert_equal(true, @array.empty?)# works , better to use assert_empty
    assert_empty @array# LS: note: 1 argument passed to assert_empty.  (it is testing if it is empty, just pass in
    # the collection (array))
  end
end

# assert_empty tests whether its first argument responds to the method #empty? with a true value.
# could use: assert_equal true, @array.empty? instead. #assert_empty is clearer and issues a better
# failure message.

