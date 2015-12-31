class Seasonal < ActiveRecord::Base
  include SeasonalDocument

  enum seasonal_type: [:media_consent, :medical, :safety_test, :team_due]
end
