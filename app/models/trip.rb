class Trip < ActiveRecord::Base
  attr_accessible :end_date, :name, :requires_teacher_permission_form, :start_date
  has_many :parent_permission_forms
  has_many :teacher_permission_forms
end
