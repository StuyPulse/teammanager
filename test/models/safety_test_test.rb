require 'test_helper'

class SafetyTestTest < ActiveSupport::TestCase
  setup do
    @safety_test = safety_tests(:fail)
  end

  test "a signed test is passed" do
    @safety_test.is_signed = true
    assert @safety_test.save
    assert @safety_test.is_passed
  end
end
