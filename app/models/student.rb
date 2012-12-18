require 'csv'

class Student < ActiveRecord::Base
  attr_accessible :father_name, :first_name, :last_name, :mother_name, :parent_cell_phone, :parent_email, :parent_home_phone, :preferred_language, :student_cell_phone, :student_email, :student_id, :year
  has_many :medical_forms
  has_many :safety_tests
  has_many :parent_permission_forms
  has_many :teacher_permission_forms
  has_many :trip_fees
  has_many :trip_deposits
  has_many :team_dues
  has_many :p_trips, through: :parent_permission_forms, source: :trip
  has_many :t_trips, through: :teacher_permission_forms, source: :trip
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_save :remove_non_digits_from_phone_number

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def has_valid_medical_on date
    self.medical_forms.where('date > ?', date - 1.year).count > 0
  end

  def remove_non_digits_from_phone_number
    student_cell_phone.gsub! /\D/, ''
    parent_home_phone.gsub! /\D/, ''
    parent_cell_phone.gsub! /\D/, ''
  end

  def all_trips
    (self.p_trips + self.t_trips).sort { |a, b| b.date <=> a.date } # Sort by date descending
  end

  def has_parent_permission_form_for trip
    self.parent_permission_forms.where(trip_id: trip.id).count > 0
  end

  def has_teacher_permission_form_for trip
    self.teacher_permission_forms.where(trip_id: trip.id).count > 0
  end

  def has_trip_deposit_for trip
    self.trip_deposits.where(trip_id: trip.id).count > 0
  end
  def has_trip_fee_for trip
    self.trip_fees.where(trip_id: trip.id).count > 0
  end

  def can_attend_trip trip
    self.has_parent_permission_form_for trip \
    and (!trip.requires_teacher_permission_form or self.has_teacher_permission_form_for trip) \
    and (!trip.requires_trip_deposit or self.has_trip_deposit_for trip) \
    and (!trip.requires_trip_fee or self.has_trip_fee_for trip) \
    and (!trip.requires_medical_form or self.has_valid_medical_on trip.end_date)
  end
  def self.to_csv
    csv_string = CSV.generate do |csv|
      column_headers = []
      column_headers += column_names.map { |name| Student.human_attribute_name(name) }
      column_headers << "Safety Test?"
      column_headers << "Medical Form?"
      column_headers << "Team Dues?"
      csv << column_headers
      Student.order(:last_name).each do |student|
         column_values = []
         column_values += student.attributes.values_at(*column_names)
         
         if student.safety_tests.any? 
           column_values << (student.safety_tests.order('year DESC').first.is_valid? ? "YES" : "NO")
         else
           column_values << "NO"
         end

         if student.medical_forms.any?
           column_values << (student.medical_forms.order('date DESC').first.is_valid? ? "YES" : "NO")
         else
           column_values << "NO"
         end

         if student.team_dues.any?
           column_values << (student.team_dues.order('year DESC').first.is_valid? ? "YES" : "NO" )
         else
           column_values << "NO"
         end
           csv << column_values
      end
    end
  end
end
