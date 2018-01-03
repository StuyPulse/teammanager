require 'test_helper'

class StimTest < ActiveSupport::TestCase
  setup do
    @stim = Stim.new(year: Date.today.year,
                     student: Student.take)
  end

  test "stim with nil has_media_consent is invalid" do
    @stim.has_media_consent = nil
    refute @stim.valid?
    assert_equal [:has_media_consent], @stim.errors.keys
  end
end
