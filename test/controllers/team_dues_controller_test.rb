require 'test_helper'

class TeamDuesControllerTest < ActionController::TestCase
  setup do
    @team_due = team_dues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_dues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_due" do
    assert_difference('TeamDue.count') do
      post :create, team_due: { student_id: @team_due.student_id, year: @team_due.year }
    end

    assert_redirected_to team_due_path(assigns(:team_due))
  end

  test "should show team_due" do
    get :show, id: @team_due
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_due
    assert_response :success
  end

  test "should update team_due" do
    patch :update, id: @team_due, team_due: { student_id: @team_due.student_id, year: @team_due.year }
    assert_redirected_to team_due_path(assigns(:team_due))
  end

  test "should destroy team_due" do
    assert_difference('TeamDue.count', -1) do
      delete :destroy, id: @team_due
    end

    assert_redirected_to team_dues_path
  end
end
