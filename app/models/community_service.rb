class CommunityService < ActiveRecord::Base
  include Seasonal

  belongs_to :student
end
