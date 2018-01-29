class TeamDue < ApplicationRecord
  include Seasonal

  has_paper_trail

  validates :excused, inclusion: { in: [ true, false ] }
end
