class Event < ApplicationRecord
  has_paper_trail

  has_many :services
  has_many :students, through: :services

  auto_strip_attributes :name, :description

  validates :name, :date, :valid_year, :default_hours, presence: true,
            allow_blank: false

  rails_admin do
    create do
      exclude_fields :services, :students
    end
  end
end
