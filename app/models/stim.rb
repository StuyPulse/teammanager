class Stim < ApplicationRecord
  include Seasonal

  belongs_to :student

  has_paper_trail
end
