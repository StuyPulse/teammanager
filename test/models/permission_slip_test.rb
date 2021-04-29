require 'test_helper'

class PermissionSlipTest < ActiveSupport::TestCase
  setup do
    @permission_slip = PermissionSlip.new(trip: Trip.take,
                                          student: Student.take)
  end

  test "permission slip must have Parent or Teacher as type" do
    @permission_slip.type = nil
    refute @permission_slip.valid?

    @permission_slip.type = "student"
    refute @permission_slip.valid?

    @permission_slip.type = "tEaChEr"
    refute @permission_slip.valid?

    @permission_slip.type = "Teacher"
    assert @permission_slip.valid?

    @permission_slip.type = "Parent"
    assert @permission_slip.valid?
  end
end
