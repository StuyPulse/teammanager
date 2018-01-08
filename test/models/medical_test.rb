require 'test_helper'

class MedicalTest < ActiveSupport::TestCase
  test "medical from a year ago is bad" do
    refute Medical.new(date: Date.today - 1.year).good?
  end

  test "medical from over a year ago is bad" do
    refute Medical.new(date: Date.today - 2.years).good?
  end

  test "medical from less than a year ago is good" do
    assert Medical.new(date: Date.today - 3.days).good?
  end
end
