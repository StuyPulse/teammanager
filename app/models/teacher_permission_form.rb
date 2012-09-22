class TeacherPermissionForm < ActiveRecord::Base
  belongs_to :student
  belongs_to :trip
end
