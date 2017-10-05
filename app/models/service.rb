class Service < ApplicationRecord
  belongs_to :student
  belongs_to :event

  before_save :set_default_hours

  rails_admin do
    visible false
  end

  def set_default_hours
    self.hours ||= event.default_hours
  end
end
