class Medical < ApplicationRecord
  has_paper_trail

  belongs_to :student

  validates :date, :student_id, presence: true

  scope :valid, -> { where('date > ?', Date.today - 1.year) }

  def good?
    date <= Date.today && Date.today < date + 1.year
  end
end
