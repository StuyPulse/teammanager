class Student < ActiveRecord::Base
  attr_accessible :father_name, :first_name, :id, :last_name, :mother_name, :parent_cell_phone, :parent_email, :parent_home_phone, :preferred_language, :student_cell_phone, :student_email, :year
  has_many :medical_forms
  has_many :safety_tests
  has_many :parent_permission_forms
  has_many :teacher_permission_forms

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def has_valid_medical_on date
    (self.medical_forms.where 'date > ?', date - 1.year).length > 0
  end

  def passed_safety_test?
    if Date.today.month < 9
      (self.safety_tests.where 'date > ?', (Date.new Date.today.year - 1, 9, 1)).length > 0
    else
      (self.safety_tests.where 'date > ?', (Date.new Date.today.year, 9, 1)).length > 0
    end
  end
end
