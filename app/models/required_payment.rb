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
    if trip.nil?
      return "Required Payment"
    end
    if amount.nil?
      return "#{self.trip.to_s.titleize} Required Payment"
    end
    "#{self.trip.name} $#{amount} #{type}"
  end
end
