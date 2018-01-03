class Stim < ApplicationRecord
  include Seasonal

  belongs_to :student

  has_paper_trail

  validates :has_media_consent, inclusion: { in: [true, false] }
end
