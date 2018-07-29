require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(email: "test")
  end

  test "stuypulse.com email will pass validation" do
    @user.email = "bryan.lai@stuypulse.com"
    assert @user.valid?
  end

  test "non-stuypulse.com email will not pass validation" do
    @user.email = "justin@kim@ironpulse.com"
    refute @user.valid?
  end
end
