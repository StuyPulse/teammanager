class MedicalForm < ActiveRecord::Base
  attr_accessible :date
  belongs_to :student
  validates :date, presence: true

  def is_valid?
    self.date > Date.today - 1.year
  end
end
