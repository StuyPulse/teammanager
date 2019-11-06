class TripDismissal < ApplicationRecord
  belongs_to :trip
  belongs_to :student
  has_one_attached :image
end
