require 'test_helper'

class PermissionSlipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permission_slip = permission_slips(:one)
  end

  test "should get index" do
    get permission_slips_url
    assert_response :success
  end

  test "should get new" do
    get new_permission_slip_url
    assert_response :success
  end

  test "should create permission_slip" do
    assert_difference('PermissionSlip.count') do
      post permission_slips_url, params: { permission_slip: { student_id: @permission_slip.student_id, trip_id: @permission_slip.trip_id, type: @permission_slip.type } }
    end

    assert_redirected_to permission_slip_url(PermissionSlip.last)
  end

  test "should show permission_slip" do
    get permission_slip_url(@permission_slip)
    assert_response :success
  end

  test "should get edit" do
    get edit_permission_slip_url(@permission_slip)
    assert_response :success
  end

  test "should update permission_slip" do
    patch permission_slip_url(@permission_slip), params: { permission_slip: { student_id: @permission_slip.student_id, trip_id: @permission_slip.trip_id, type: @permission_slip.type } }
    assert_redirected_to permission_slip_url(@permission_slip)
  end

  test "should destroy permission_slip" do
    assert_difference('PermissionSlip.count', -1) do
      delete permission_slip_url(@permission_slip)
    end

    assert_redirected_to permission_slips_url
  end
end
