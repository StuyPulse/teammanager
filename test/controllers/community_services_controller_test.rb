require 'test_helper'

class CommunityServicesControllerTest < ActionController::TestCase
  setup do
    @community_service = community_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:community_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community_service" do
    assert_difference('CommunityService.count') do
      post :create, community_service: { description: @community_service.description, hours: @community_service.hours, student_id: @community_service.student_id, year: @community_service.year }
    end

    assert_redirected_to community_service_path(assigns(:community_service))
  end

  test "should show community_service" do
    get :show, id: @community_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community_service
    assert_response :success
  end

  test "should update community_service" do
    patch :update, id: @community_service, community_service: { description: @community_service.description, hours: @community_service.hours, student_id: @community_service.student_id, year: @community_service.year }
    assert_redirected_to community_service_path(assigns(:community_service))
  end

  test "should destroy community_service" do
    assert_difference('CommunityService.count', -1) do
      delete :destroy, id: @community_service
    end

    assert_redirected_to community_services_path
  end
end
