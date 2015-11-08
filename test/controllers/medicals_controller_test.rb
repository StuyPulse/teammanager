require 'test_helper'

class MedicalsControllerTest < ActionController::TestCase
  setup do
    @medical = medicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical" do
    assert_difference('Medical.count') do
      post :create, medical: { student_id: @medical.student_id, year: @medical.year }
    end

    assert_redirected_to medical_path(assigns(:medical))
  end

  test "should show medical" do
    get :show, id: @medical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical
    assert_response :success
  end

  test "should update medical" do
    patch :update, id: @medical, medical: { student_id: @medical.student_id, year: @medical.year }
    assert_redirected_to medical_path(assigns(:medical))
  end

  test "should destroy medical" do
    assert_difference('Medical.count', -1) do
      delete :destroy, id: @medical
    end

    assert_redirected_to medicals_path
  end
end
