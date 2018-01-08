class TeamDue < ApplicationRecord
  include Seasonal

  has_paper_trail
end
