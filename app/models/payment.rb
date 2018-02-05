# Payment represents the actual payment that a student gives in.
class Payment < ApplicationRecord
  belongs_to :student
  belongs_to :required_payment

  validates :excused, inclusion: { in: [ true, false ] }
  validates_uniqueness_of :student_id, scope: :required_payment_id,
    message: " already gave in this required payment."
end
