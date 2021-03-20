require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

# For this test, make sure that #accept_money properly changes
# the amount of money returned by #total_money. Need to set
# up the necessary objects to test this method.
class CashRegisterTest < Minitest::Test 
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(30)
    transaction.amount_paid = 40

    assert_equal 10, register.change(transaction)
  end

  def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do 
      register.give_receipt(transaction)
    end
  end
  
  # def test_give_receipt # (my test)
  #   register = CashRegister.new(1000)
  #   transaction = Transaction.new(30)
  #   transaction.amount_paid = 40
  #   assert_equal("You've paid $30.", register.give_receipt(transaction))

  # end # (my test, commented out #puts in #give_receipt)

  # def test_change #(my test)
  #   register = CashRegister.new(1000)
  #   transaction = Transaction.new(20)
  #   transaction.amount_paid = 30
  #   actual_change = transaction.amount_paid - transaction.item_cost

  #   assert_equal(actual_change, register.change(transaction))
  # end

  # (my test_accept_money)
  # def setup
  #   @reg1 = CashRegister.new(100)
  #   @trans1 = Transaction.new(10)
  # end

  # def test_accept_money
  #   @trans1.amount_paid = 20

  #   new_total = @reg1.accept_money(@trans1)
  #   assert_equal(120, new_total)
  # end
  # passed test: LS below:

end