class PermissionSlip < ApplicationRecord
  # This allows for use of the column 'type'
  self.inheritance_column = 'not_type'

  belongs_to :trip
  belongs_to :student

  validates :type, presence: true, allow_blank: false,
                   inclusion: { in: %w(Parent Teacher) }

  def type_enum
    ['Parent', 'Teacher']
  end
end
