module SeasonalsHelper
  def current_year_range
    year = Time.now.year
    month = Time.now.month

    if month < 9
      "#{year-1}-#{year}"
    else
      "#{year}-#{year+1}"
    end
  end

  def id_name(seasonal_type)
    seasonal_type.name.underscore.gsub("_", "-")
  end
end
