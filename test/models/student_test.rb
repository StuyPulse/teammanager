require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "osis with 9 digits will pass validations" do
    student = Student.new(first_name: "first",
                          last_name: "last",
                          grad_year: 2000,
                          phone: "1234567890",
                          email: "student@test.com")
    student.parents << Parent.take
    student.osis = 123456789
    assert student.valid?
  end

  test "osis with less than 9 digit will not pass validations" do
    student = Student.new(first_name: "first",
                          last_name: "last",
                          grad_year: 2000,
                          phone: "1234567890",
                          email: "student@test.com")
    student.parents << Parent.take
    student.osis = 12345678
    refute student.valid?
    assert_equal [:osis], student.errors.keys
  end

  test "osis with greater than 9 digit will not pass validations" do
    student = Student.new(first_name: "first",
                          last_name: "last",
                          grad_year: 2000,
                          phone: "1234567890",
                          email: "student@test.com")
    student.parents << Parent.take
    student.osis = 1234567890
    refute student.valid?
    assert_equal [:osis], student.errors.keys
  end

  test "negative osis with 9 characters will not pass validations" do
    student = Student.new(first_name: "first",
                          last_name: "last",
                          grad_year: 2000,
                          phone: "1234567890",
                          email: "student@test.com")
    student.parents << Parent.take
    student.osis = -12345678
    refute student.valid?
    assert_equal ['cannot be negative'], student.errors.messages[:osis]
  end
end
