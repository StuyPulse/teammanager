class Dinner < ActiveRecord::Base
  attr_accessible :volunteer_name, :volunteer_phone, :volunteer_email, :meal_description, :student_id, :notes, :date
  validates_presence_of :volunteer_name
  validates_presence_of :volunteer_phone
  validates_presence_of :meal_description

  before_save :remove_non_digits_from_phone_number


  def remove_non_digits_from_phone_number
    volunteer_phone.gsub! /\D/, ''
  end
end
