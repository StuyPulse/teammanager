# Several assumptions are made for trips on Team Manager:
#   - Not all trips require teacher permission forms (e.g. NYC Regional, sometimes)
#     - Trips that MAY require teacher permission forms require the creation of two separate trips.
#   - All trips require parent permission slips
#   - Students require all forms to go on a trip (STIM, team due, media consent, medical, and safety test)
#   - There are only two types of permission slips: parent/teacher
#   - There are only two types of required payments: deposit/fee
class Trip < ApplicationRecord
  has_and_belongs_to_many :students
  has_many :permission_slips
  has_many :required_payments
  attr_accessor :importStudents
  validates :name, presence: true, allow_blank: false
  validates :requires_teacher_permission, inclusion: { in: [ true, false ] }
end
