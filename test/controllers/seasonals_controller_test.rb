require 'test_helper'

class SeasonalsControllerTest < ActionController::TestCase
  setup do
    @seasonal = seasonals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasonals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seasonal" do
    assert_difference('Seasonal.count') do
      post :create, seasonal: { seasonal_type: @seasonal.seasonal_type, student_id: @seasonal.student_id, year: @seasonal.year }
    end

    assert_redirected_to seasonal_path(assigns(:seasonal))
  end

  test "should show seasonal" do
    get :show, id: @seasonal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seasonal
    assert_response :success
  end

  test "should update seasonal" do
    patch :update, id: @seasonal, seasonal: { seasonal_type: @seasonal.seasonal_type, student_id: @seasonal.student_id, year: @seasonal.year }
    assert_redirected_to seasonal_path(assigns(:seasonal))
  end

  test "should destroy seasonal" do
    assert_difference('Seasonal.count', -1) do
      delete :destroy, id: @seasonal
    end

    assert_redirected_to seasonals_path
  end
end
