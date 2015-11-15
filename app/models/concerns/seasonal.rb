# Seasonal documents expire at the beginning of a new school year.
#
# Safety tests, team dues, and media consent forms are examples of seasonal
# documents that are invalidated at the beginning of a new school year.
#
# The `year` field for Seasonals describes the last year the form is valid. An
# easy way to remember this is that the year is the same as the FRC season for
# that school year.
# Ex.: A safety test with year 2015 is valid for the 2014-2015 school year.
# Ex.: A team due with year 2016 is valid for the 2015-2016 school year.
module Seasonal
  extend ActiveSupport::Concern

  included do
    validates :student_id, :year, presence: true

    before_validation :add_current_year

    scope :valid, -> { where(year: current_season_year) }
  end

  def add_current_year
    self.year ||= self.class.current_season_year
  end

  module ClassMethods
    def current_season_year
      year = Time.now.year

      Time.now.month < 9 ? year : year + 1
    end
  end
end
