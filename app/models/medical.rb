class Medical < ApplicationRecord
  belongs_to :student

  validates :date, :student_id, presence: true
end
