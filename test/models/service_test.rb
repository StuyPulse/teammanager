require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  setup do
    @event = events(:soupkitchen);
  end

  test "service without hours set to default hours of event" do
    s = Service.new(student: Student.take,
                    event: @event)
    s.save
    assert s.hours == @event.default_hours
  end

  test "service with hours set to default hours of event" do
    s = Service.new(student: Student.take,
                    event: @event,
                    hours: 3.0)
    s.save
    assert s.hours == 3.0
  end
end
