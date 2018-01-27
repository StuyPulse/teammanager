class Payment < ApplicationRecord
  belongs_to :student
  belongs_to :required_payment

  validates :excused, inclusion: { in: [ true, false ] }
end
