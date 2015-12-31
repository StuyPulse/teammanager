class Seasonal < ActiveRecord::Base
  include SeasonalDocument

  enum seasonal_type: {
    media_consent: 0,
    medical: 1,
    safety_test: 2,
    team_due: 3
  }
end
