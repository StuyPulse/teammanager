class CommunityService < ActiveRecord::Base
  include SeasonalDocument

  belongs_to :student
end
