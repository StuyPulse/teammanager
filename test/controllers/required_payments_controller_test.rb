require 'test_helper'

class RequiredPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @required_payment = required_payments(:one)
  end

  test "should get index" do
    get required_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_required_payment_url
    assert_response :success
  end

  test "should create required_payment" do
    assert_difference('RequiredPayment.count') do
      post required_payments_url, params: { required_payment: { amount: @required_payment.amount, trip_id: @required_payment.trip_id, type: @required_payment.type } }
    end

    assert_redirected_to required_payment_url(RequiredPayment.last)
  end

  test "should show required_payment" do
    get required_payment_url(@required_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_required_payment_url(@required_payment)
    assert_response :success
  end

  test "should update required_payment" do
    patch required_payment_url(@required_payment), params: { required_payment: { amount: @required_payment.amount, trip_id: @required_payment.trip_id, type: @required_payment.type } }
    assert_redirected_to required_payment_url(@required_payment)
  end

  test "should destroy required_payment" do
    assert_difference('RequiredPayment.count', -1) do
      delete required_payment_url(@required_payment)
    end

    assert_redirected_to required_payments_url
  end
end
