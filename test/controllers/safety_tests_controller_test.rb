require 'test_helper'

class SafetyTestsControllerTest < ActionController::TestCase
  setup do
    @safety_test = safety_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:safety_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create safety_test" do
    assert_difference('SafetyTest.count') do
      post :create, safety_test: { student_id: @safety_test.student_id, year: @safety_test.year }
    end

    assert_redirected_to safety_test_path(assigns(:safety_test))
  end

  test "should show safety_test" do
    get :show, id: @safety_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @safety_test
    assert_response :success
  end

  test "should update safety_test" do
    patch :update, id: @safety_test, safety_test: { student_id: @safety_test.student_id, year: @safety_test.year }
    assert_redirected_to safety_test_path(assigns(:safety_test))
  end

  test "should destroy safety_test" do
    assert_difference('SafetyTest.count', -1) do
      delete :destroy, id: @safety_test
    end

    assert_redirected_to safety_tests_path
  end
end
