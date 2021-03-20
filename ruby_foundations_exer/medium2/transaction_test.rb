require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  # def test_prompt_for_payment
  #   input = StringIO.new("40\n")
  #   transaction = Transaction.new(30)
  #   assert_output("You owe $#{transaction.item_cost}.\nHow much are you paying?\n") do
  #     transaction.prompt_for_payment(input: input)
  #   end
  # end# passed test

  # def test_prompt_for_payment
  #   transaction = Transaction.new(30)
  #   input = StringIO.new('30\n')
  #   transaction.prompt_for_payment(input: input)
  #   assert_equal 30, transaction.amount_paid
  # end

# LS: did not test the output. Also output from method 
# displayed on test screen.  Only tested for 'amount_paid'
# solution: 'assert that the right amount was paid'

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end
# Create another mock object (output = StringIO.new) . Unlike when we created a mock object for input, we don't have to set
# the String for our mock(output). We'll end up calling StringIO#puts on output and that is what will set the String value for
# our StringIO mock object(output). Second, we have to alter the method to accept a mock of our output. (Similar way).
# Then we use this output mock object within our method, we call StringIO#puts and the string passed to puts gets stored within
# the StringIO object.  It is not ouput to the user. Cleans up our testing output when running minitest.
