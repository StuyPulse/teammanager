class PermissionSlip < ApplicationRecord
  # This allows for use of the column 'type'
  self.inheritance_column = 'not_type'

  belongs_to :trip
  belongs_to :student

  validates :type, presence: true, allow_blank: false,
                   inclusion: { in: %w(Parent Teacher) }
  validates_uniqueness_of :student_id, scope: [:trip_id, :type],
    message: " already has this type of permission slip for this trip."

  def type_enum
    ['Parent', 'Teacher']
  end
end
