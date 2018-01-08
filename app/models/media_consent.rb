class MediaConsent < ApplicationRecord
  include Seasonal

  has_paper_trail
end
