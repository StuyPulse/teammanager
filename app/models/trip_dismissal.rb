class TripDismissal < ApplicationRecord
  belongs_to :trip
  belongs_to :student
end
