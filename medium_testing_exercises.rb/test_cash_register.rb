require "minitest/autorun"
require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < MiniTest::Test

  def test_accept_money
    register = CashRegister.new(100)
    txn = Transaction.new(25)
    txn.amount_paid = 25
    register.accept_money(txn)
    assert_equal(125, register.total_money)
  end

  def test_change
    register = CashRegister.new(100)
    txn = Transaction.new(25)
    txn.amount_paid = 30
    assert_equal(5, register.change(txn))
  end

  def test_give_receipt
    register = CashRegister.new(100)
    txn = Transaction.new(25)
    assert_output("You've paid $25.\n") {register.give_receipt(txn) }
  end

end

class TransactionTest < MiniTest::Test

  def test_prompt_for_payment
    txn1 = Transaction.new(20)
    input = StringIO.new("20\n")
    output = StringIO.new("")
    assert_nil(txn1.prompt_for_payment(input: input, output: output))
    assert_equal(20, txn1.amount_paid)
  end


end