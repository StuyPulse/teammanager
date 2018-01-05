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

  test "stim without media consent with nil has_guardian is invalid" do
    @stim.has_media_consent = false
    @stim.has_guardian = nil
    refute @stim.valid?
    assert_equal [:has_guardian], @stim.errors.keys
  end

  test "stim with media consent has a guardian and is valid" do
    @stim.has_guardian = false
    @stim.has_media_consent = true
    assert @stim.save
    assert @stim.has_guardian
  end

  test "scope consented requires has_media_consent = true" do
    assert_equal Stim.consented.count, 2
  end
end
