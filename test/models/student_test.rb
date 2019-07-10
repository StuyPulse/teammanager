require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  setup do
    @student = Student.new(first_name: "first",
                          last_name: "last",
                          grad_year: 2000,
                          phone: "1234567890",
                          email: "student@test.com",
                          osis: 123456789,
                          gender: "Other")
    @medical1 = Medical.new(student: @student, date: 2014-12-01)
    @medical2 = Medical.new(student: @student, date: 2015-11-11)
    @medical3 = Medical.new(student: @student, date: 2013-6-03)
    @student.parents << Parent.take
  end

  test "osis with 9 digits will pass validations" do
    @student.osis = 123456789
    assert @student.valid?
  end

  test "osis with less than 9 digit will not pass validations" do
    @student.osis = 12345678
    refute @student.valid?
    assert_equal [:osis], @student.errors.keys
  end

  test "osis with greater than 9 digit will not pass validations" do
    @student.osis = 1234567890
    refute @student.valid?
    assert_equal [:osis], @student.errors.keys
  end

  test "negative osis with 9 characters will not pass validations" do
    @student.osis = -12345678
    refute @student.valid?
    assert_equal ['cannot be negative'], @student.errors.messages[:osis]
  end

  test "student with whitespace in fields stripped" do
    @student.first_name = "\t\tmary \n"
    assert @student.save
    assert @student.first_name == "mary"

    @student.last_name = "\t\r\n   kim-kim \n"
    assert @student.save
    assert @student.last_name == "kim-kim"

    @student.preferred_name = "\t\r\n  bob \n"
    assert @student.save
    assert @student.preferred_name == "bob"

    @student.email = "\t\r\n   mary@example.com \n"
    assert @student.save
    assert @student.email == "mary@example.com"

    @student.team_email = "\t\r\n   mary@example.com \n"
    assert @student.save
    assert @student.team_email == "mary@example.com"
  end

  test "student validates preferred name is not first name" do
    @student.preferred_name = "mary"
    assert @student.save
    @student.preferred_name = "First"
    refute @student.save
    @student.preferred_name = "fIrSt"
    refute @student.save
  end

  test "is_graduated?" do
    assert students(:alum).is_graduated?
    refute students(:helen).is_graduated?
  end

  test "last_valid_medical returns last valid medical" do
    assert student.last_valid_medical == @medical2
  end

  test "scope active requires is_active = true" do
    assert_equal Student.active.count, 3
  end
end
