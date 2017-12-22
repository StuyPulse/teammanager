require 'test_helper'

class StimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stim = stims(:one)
  end

  test "should get index" do
    get stims_url
    assert_response :success
  end

  test "should get new" do
    get new_stim_url
    assert_response :success
  end

  test "should create stim" do
    assert_difference('Stim.count') do
      post stims_url, params: { stim: { student_id: @stim.student_id, year: @stim.year } }
    end

    assert_redirected_to stim_url(Stim.last)
  end

  test "should show stim" do
    get stim_url(@stim)
    assert_response :success
  end

  test "should get edit" do
    get edit_stim_url(@stim)
    assert_response :success
  end

  test "should update stim" do
    patch stim_url(@stim), params: { stim: { student_id: @stim.student_id, year: @stim.year } }
    assert_redirected_to stim_url(@stim)
  end

  test "should destroy stim" do
    assert_difference('Stim.count', -1) do
      delete stim_url(@stim)
    end

    assert_redirected_to stims_url
  end
end
