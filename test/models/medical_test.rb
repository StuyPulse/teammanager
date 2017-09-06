require 'test_helper'

class MedicalTest < ActiveSupport::TestCase
  test "medical from a year ago is invalid" do
    refute Medical.new(date: Date.today - 1.year).valid?
  end

  test "medical from over a year ago is invalid" do
    refute Medical.new(date: Date.today - 2.years).valid?
  end

  test "medical from less than a year ago is valid" do
    assert Medical.new(date: Date.today - 3.days).valid?
  end
end
