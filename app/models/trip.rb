class Trip < ActiveRecord::Base
  attr_accessible :end_date, :name, :requires_teacher_permission_form, :start_date
end
