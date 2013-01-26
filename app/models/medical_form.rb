# == Schema Information
#
# Table name: medical_forms
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#

class MedicalForm < ActiveRecord::Base
  attr_accessible :date
  belongs_to :student
  validates :date, presence: true

  def is_valid?
    self.date > 1.year.ago.to_date
  end
end
