# == Schema Information
#
# Table name: trip_fees
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  trip_id    :integer
#

class TripFee < ActiveRecord::Base
  belongs_to :student
  belongs_to :trip
  attr_accessible :trip_id
  validates :student_id, presence: true
  validates :trip_id, presence: true
end
