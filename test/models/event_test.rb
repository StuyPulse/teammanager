require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = events(:soupkitchen)
  end

  test "event with whitespace in fields stripped" do
    @event.name = "\t\tname \n"
    assert @event.save
    assert @event.name == "name"

    @event.name = "\t\n\rHoly Apostles Soup    Kitchen Event    \t"
    assert @event.save
    assert @event.name == "Holy Apostles Soup    Kitchen Event"
  end
end
