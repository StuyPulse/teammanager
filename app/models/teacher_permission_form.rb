class TeacherPermissionForm < ActiveRecord::Base
  belongs_to :student
  belongs_to :trip
  validates :student_id, presence: true
  validates :trip_id, presence: true
end
