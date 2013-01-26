# == Schema Information
#
# Table name: safety_tests
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  year       :integer
#

class SafetyTest < ActiveRecord::Base
  attr_accessible :year
  belongs_to :student
  validates :year, presence: true
  validates_uniqueness_of :year, scope: :student_id

  def is_valid?
    if Date.today.month < 9
      Date.new(self.year - 1, 9, 1) >= Date.new(1.year.ago.year, 9, 1)
    else
      Date.new(self.year - 1, 9, 1) >= Date.new(Date.today.year, 9, 1)
    end
  end
end
