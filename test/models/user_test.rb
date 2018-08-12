require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(email: "test@stuypulse.com")
  end

  test "stuypulse.com email will pass validation" do
    @user.email = "bryan.lai@stuypulse.com"
    assert @user.valid?
  end

  test "non-stuypulse.com email will not pass validation" do
    @user.email = "justin@kim@ironpulse.com"
    refute @user.valid?
  end

  test "student and user are already linked" do
    @user.email = 'nicole.shin@stuypulse.com'
    @user.student = students(:helen)
    @user.save
    assert @user.student == students(:helen)
  end

  test "student is not linked to the user" do
    @user.email = "nicole.shin@stuypulse.com"
    @user.save
    assert @user.student == students(:nicole)
  end

  test "student does not exist for the user" do
    @user.save
    refute @user.student
  end
end
