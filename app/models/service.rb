class Service < ApplicationRecord
  belongs_to :student
  belongs_to :event

  before_validation :set_default_hours

  validates :hours, numericality: { greater_than: 0 }, presence: true

  rails_admin do
    visible false
  end

  def set_default_hours
    self.hours ||= event.default_hours
  end
end
