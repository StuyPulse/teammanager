class MediaConsent < ApplicationRecord
  include Seasonal
  has_one_attached :image
  has_paper_trail
end
