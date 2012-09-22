class Student < ActiveRecord::Base
  attr_accessible :father_name, :first_name, :id, :last_name, :mother_name, :parent_cell_phone, :parent_email, :parent_home_phone, :preferred_language, :student_cell_phone, :student_email, :year
  has_many :medical_forms
  has_many :safety_tests
  has_many :parent_permission_forms
  has_many :teacher_permission_forms

  def has_valid_medical_on date
    (self.medical_forms.where 'date > ?', date - 1.year).length > 0
  end
end
