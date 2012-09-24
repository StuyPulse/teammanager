class SafetyTest < ActiveRecord::Base
  attr_accessible :date
  belongs_to :student
  validates :date, presence: true

  def is_valid?
    if Date.today.month < 9
      self.date > Date.new(1.year.ago.year, 9, 1)
    else
      self.date > Date.new(Date.today.year, 9, 1)
    end
  end
end
