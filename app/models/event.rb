class Event < ApplicationRecord
  has_many :services
  has_many :students, through: :services

  validates :name, :date, :valid_year, :default_hours, presence: true,
            allow_blank: false

  rails_admin do
    create do
      exclude_fields :services, :students
    end
  end
end
