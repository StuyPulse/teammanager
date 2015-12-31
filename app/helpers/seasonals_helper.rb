module SeasonalsHelper
  def current_year_range
    year = Seasonal.current_season_year
    "#{year-1}-#{year}"
  end

  def id_name(seasonal_type)
    # TODO: remove to_s
    seasonal_type.to_s.gsub("_", "-")
  end

  def glyphicon(seasonal_type)
    case seasonal_type
    when 'media_consent'
      'glyphicon-camera'
    when 'medical'
      'glyphicon-heart'
    when 'safety_test'
      'glyphicon-warning-sign'
    when 'team_due'
      'glyphicon-euro'
    else
      'glyphicon-question-sign'
    end
  end
end
