class SafetyTest < ActiveRecord::Base
  attr_accessible :year
  belongs_to :student
  validates :year, presence: true

  def is_valid?
    if Date.today.month < 9
      Date.new(self.year - 1, 9, 1) >= Date.new(1.year.ago.year, 9, 1)
    else
      Date.new(self.year - 1, 9, 1) >= Date.new(Date.today.year, 9, 1)
    end
  end
end
