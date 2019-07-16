require 'test_helper'

class TripDismissalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_dismissal = trip_dismissals(:one)
  end

  test "should get index" do
    get trip_dismissals_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_dismissal_url
    assert_response :success
  end

  test "should create trip_dismissal" do
    assert_difference('TripDismissal.count') do
      post trip_dismissals_url, params: { trip_dismissal: { student_id: @trip_dismissal.student_id, trip_id: @trip_dismissal.trip_id } }
    end

    assert_redirected_to trip_dismissal_url(TripDismissal.last)
  end

  test "should show trip_dismissal" do
    get trip_dismissal_url(@trip_dismissal)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_dismissal_url(@trip_dismissal)
    assert_response :success
  end

  test "should update trip_dismissal" do
    patch trip_dismissal_url(@trip_dismissal), params: { trip_dismissal: { student_id: @trip_dismissal.student_id, trip_id: @trip_dismissal.trip_id } }
    assert_redirected_to trip_dismissal_url(@trip_dismissal)
  end

  test "should destroy trip_dismissal" do
    assert_difference('TripDismissal.count', -1) do
      delete trip_dismissal_url(@trip_dismissal)
    end

    assert_redirected_to trip_dismissals_url
  end
end
