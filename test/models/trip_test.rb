require 'test_helper'

class TripTest < ActiveSupport::TestCase
  test "trip without name or requires_teacher_permission are invalid" do
    @trip = Trip.new(requires_teacher_permission: false)
    refute @trip.valid?
    assert_equal [:name], @trip.errors.keys

    @trip.requires_teacher_permission = nil
    @trip.name = "Test Trip"
    refute @trip.valid?
    assert_equal [:requires_teacher_permission], @trip.errors.keys
  end
end
