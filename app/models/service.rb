class Service < ApplicationRecord
  belongs_to :student
  belongs_to :event

  rails_admin do
    visible false
  end
end
