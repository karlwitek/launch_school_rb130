# Write a test that will fail if 'xyz' is one of the elements in the Array list

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class MyListTest < MiniTest::Test
  # def setup
  #   @array = ['abc', 'def']
  # end # using #setup is probably preferred to initializing a local variable inside #test_refute
  

  def test_refute
    array = ['abc', 'def']
    refute_includes array, 'xyz'
  end
end