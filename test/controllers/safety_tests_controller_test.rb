require 'test_helper'

class SafetyTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @safety_test = safety_tests(:passed)
  end

  test "should get index" do
    get safety_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_safety_test_url
    assert_response :success
  end

  test "should create safety_test" do
    assert_difference('SafetyTest.count') do
      post safety_tests_url, params: { safety_test: { is_passed: @safety_test.is_passed, is_signed: @safety_test.is_signed, student_id: @safety_test.student_id, year: @safety_test.year } }
    end

    assert_redirected_to safety_test_url(SafetyTest.last)
  end

  test "should show safety_test" do
    get safety_test_url(@safety_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_safety_test_url(@safety_test)
    assert_response :success
  end

  test "should update safety_test" do
    patch safety_test_url(@safety_test), params: { safety_test: { is_passed: @safety_test.is_passed, is_signed: @safety_test.is_signed, student_id: @safety_test.student_id, year: @safety_test.year } }
    assert_redirected_to safety_test_url(@safety_test)
  end

  test "should destroy safety_test" do
    assert_difference('SafetyTest.count', -1) do
      delete safety_test_url(@safety_test)
    end

    assert_redirected_to safety_tests_url
  end
end
