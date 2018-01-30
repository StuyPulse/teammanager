# Required payments represent the payments required for a student 
# to go on a trip.
#
# They DO NOT represent the student's actual payment.
# For example, the 2018 Central New York Regional required:
#   - a $100 deposit
#   - a $250 fee
# A trip will only ever have one deposit, which is the first payment,
# but it may have many fees.
class RequiredPayment < ApplicationRecord
  # This allows for use of the column 'type'
  self.inheritance_column = 'not_type'

  belongs_to :trip
  has_many :payments

  validates :type, :amount, presence: true, allow_blank: false
  validates :amount, numericality: { greater_than: 0 }
  validates :type, inclusion: { in: %w(Deposit Fee) }

  def type_enum
    ['Deposit', 'Fee']
  end

  def name
    if trip.nil? or amount <= 0
      return "Required Payment"
    end
    "#{self.trip.name} $#{amount} #{type}"
  end
end
