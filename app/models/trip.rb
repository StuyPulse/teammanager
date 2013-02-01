# == Schema Information
#
# Table name: trips
#
#  id                               :integer          not null, primary key
#  name                             :string(255)
#  start_date                       :date
#  end_date                         :date
#  requires_teacher_permission_form :boolean
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  requires_medical_form            :boolean
#  requires_trip_deposit            :boolean
#  requires_trip_fee                :boolean
#

class Trip < ActiveRecord::Base
  attr_accessible :end_date, :name, :requires_medical_form, :requires_teacher_permission_form, :requires_trip_deposit, :requires_trip_fee, :start_date
  has_many :parent_permission_forms
  has_many :teacher_permission_forms
  has_many :trip_fees
  has_many :trip_deposits
  has_many :p_students, through: :parent_permission_forms, source: :student
  has_many :t_students, through: :teacher_permission_forms, source: :student
  has_many :f_students, through: :trip_fees, source: :student
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def all_students
    students_list = 
    (self.p_students + self.t_students + self.f_students).sort do |a, b|
      comp = a.last_name <=> b.last_name
      comp.zero? ? (a.first_name <=> b.first_name) : comp
    end
    students_list.uniq! #remove duplicates
    students_list
  end
end
