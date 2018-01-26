class Trip < ApplicationRecord
  has_and_belongs_to_many :students

  validates :name, presence: true, allow_blank: false
  validates :requires_teacher_permission, inclusion: { in: [ true, false ] }
end
