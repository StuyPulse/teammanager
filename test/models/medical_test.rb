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

  test "name includes year and model name" do
    assert_equal "2018-02-03 Medical",
      Medical.new(date: Date.new(2018, 2, 3)).name
  end

  test "name of a new medical is nothing" do
    assert_equal "Medical",
      Medical.new.name
  end
end
