require 'test_helper'

class RequiredPaymentTest < ActiveSupport::TestCase
  setup do
    @required_payment = RequiredPayment.new(trip: Trip.take,
                                            amount: 694,
                                            type: "Deposit")
  end

  test "required payment with amount less than or equal to 0 is invalid" do
    @required_payment.amount = -694
    refute @required_payment.valid?
    assert_equal [:amount], @required_payment.errors.keys

    @required_payment.amount = 0
    refute @required_payment.valid?
    assert_equal [:amount], @required_payment.errors.keys

    @required_payment.amount = 694
    assert @required_payment.valid?
  end

  test "required payment must have Deposit or Fee as type" do
    @required_payment.type = nil
    refute @required_payment.valid?

    @required_payment.type = "Money"
    refute @required_payment.valid?

    @required_payment.type = "dEpOsIt"
    refute @required_payment.valid?

    @required_payment.type = "Deposit"
    assert @required_payment.valid?

    @required_payment.type = "Fee"
    assert @required_payment.valid?
  end

  test "name of a required payment with nil trip or amount is nothing" do
    @required_payment = RequiredPayment.new(type: "Fee")
    assert_equal "Required Payment", @required_payment.name

    @required_payment.trip = Trip.take
    assert_equal "Required Payment", @required_payment.name

    @required_payment.trip = nil
    @required_payment.amount = 694
    assert_equal "Required Payment", @required_payment.name
  end

  test "name includes trip name and amount" do
    @required_payment = required_payments(:cnydeposit)
    assert_equal "2018 Central New York Regional $100 Deposit",
      @required_payment.name
  end
end
