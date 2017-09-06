class Event < ApplicationRecord
  has_many :services
  has_many :students, through: :services

  validates :name, :date, :valid_year, presence: true, allow_blank: false
end
