class Trip < ApplicationRecord
  has_and_belongs_to_many :students
  has_many :permission_slips

  validates :name, presence: true, allow_blank: false
  validates :requires_teacher_permission, inclusion: { in: [ true, false ] }
end
