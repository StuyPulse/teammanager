require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @parents = parents(:mom, :dad)
    @student = students(:helen)
    @user = User.create(email: "user@stuypulse.com")
    @admin = User.create(email: "admin@stuypulse.com", is_admin: true)
  end

  test "should get index" do
    sign_in @admin
    get students_url
    assert_response :success
  end

  test "should get new" do
    sign_in @admin
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    sign_in @admin
    assert_difference('Student.count') do
      post students_url, params: { student: { email: @student.email, first_name: @student.first_name, grad_year: @student.grad_year, last_name: @student.last_name, osis: @student.osis, phone: @student.phone, preferred_name: @student.preferred_name, team_id: @student.team_id } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    sign_in @admin
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    sign_in @admin
    patch student_url(@student), params: { student: { email: @student.email, first_name: @student.first_name, grad_year: @student.grad_year, last_name: @student.last_name, osis: @student.osis, phone: @student.phone, preferred_name: @student.preferred_name, team_id: @student.team_id } }
    assert_redirected_to student_url(@student)
  end

  test "should not be able to destroy student" do
    sign_in @admin
    assert_difference('Student.count', 0) do
      assert_raises(Pundit::NotAuthorizedError) do
        delete student_url(@student)
      end
    end
  end
end
