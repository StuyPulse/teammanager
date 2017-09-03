class TeamDue < ApplicationRecord
  belongs_to :student

  validates :year, :student, presence: true
end
