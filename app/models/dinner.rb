# == Schema Information
#
# Table name: dinners
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  volunteer_name   :string(255)
#  volunteer_phone  :string(255)
#  volunteer_email  :string(255)
#  meal_description :string(255)
#  notes            :string(255)
#  student_id       :integer
#  date             :date
#

class Dinner < ActiveRecord::Base
  attr_accessible :volunteer_name, :volunteer_phone, :volunteer_email, :meal_description, :student_id, :notes, :date
  validates_presence_of :date
  validates_presence_of :volunteer_name
  validates_presence_of :volunteer_phone
  validates_presence_of :meal_description

  before_save :remove_non_digits_from_phone_number

  def remove_non_digits_from_phone_number
    volunteer_phone.gsub! /\D/, ''
  end
end
