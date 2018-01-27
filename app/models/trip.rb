class Trip < ApplicationRecord
  has_and_belongs_to_many :students
  has_many :permission_slips
  has_many :required_payments

  validates :name, presence: true, allow_blank: false
  validates :requires_teacher_permission, inclusion: { in: [ true, false ] }
end
