class TripDeposit < ActiveRecord::Base
  belongs_to :student
  belongs_to :trip
  attr_accessible :trip_id
  validates :student_id, presence: true
  validates :trip_id, presence: true
end
