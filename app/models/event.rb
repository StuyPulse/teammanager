class Event < ApplicationRecord
  validates :name, :date, :valid_year, presence: true, allow_blank: false
end
