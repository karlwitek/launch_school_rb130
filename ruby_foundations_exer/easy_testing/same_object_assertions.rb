# Write a test that will fail if list and the return value of list.process are 
# different objects.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class MyList
  def process
    self
  end
end

class ListTest < MiniTest::Test
  def test_return_value
    list = MyList.new
    # assert_equal(list, list.process) # works. LS next line
    assert_same list, list.process
  end
end

# #assert_same tests whether its first and second arguments are the same object, as determined by #equal?


