require 'test_helper'

class TeamDuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_due = team_dues(:one)
  end

  test "should get index" do
    get team_dues_url
    assert_response :success
  end

  test "should get new" do
    get new_team_due_url
    assert_response :success
  end

  test "should create team_due" do
    assert_difference('TeamDue.count') do
      post team_dues_url, params: { team_due: { student_id: @team_due.student_id, year: @team_due.year } }
    end

    assert_redirected_to team_due_url(TeamDue.last)
  end

  test "should show team_due" do
    get team_due_url(@team_due)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_due_url(@team_due)
    assert_response :success
  end

  test "should update team_due" do
    patch team_due_url(@team_due), params: { team_due: { student_id: @team_due.student_id, year: @team_due.year } }
    assert_redirected_to team_due_url(@team_due)
  end

  test "should destroy team_due" do
    assert_difference('TeamDue.count', -1) do
      delete team_due_url(@team_due)
    end

    assert_redirected_to team_dues_url
  end
end
