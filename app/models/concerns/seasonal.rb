# Seasonal documents expire at the beginning of a new school year.
#
# Safety tests, team dues, and media consent forms are examples of seasonal
# documents that do 
module Seasonal
  extend ActiveSupport::Concern

  included do
    scope :valid, -> { where(year: current_season_year) }
  end

  module ClassMethods
    def current_season_year
      month = Time.now.month
      year = Time.now.year

      month < 9 ? year - 1 : year
    end
  end
end
