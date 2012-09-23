class SafetyTest < ActiveRecord::Base
  attr_accessible :date
  belongs_to :student

  def is_valid?
    if Date.today.month < 9
      self.date > Date.new(Date.today.year - 1, 9, 1)
    else
      self.date > Date.new(Date.today.year, 9, 1)
    end
  end
end
