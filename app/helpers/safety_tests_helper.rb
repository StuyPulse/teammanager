module SafetyTestsHelper
  def current_year_range
    year = Time.now.year
    month = Time.now.month

    if month < 9
      "#{year-1}-#{year}"
    else
      "#{year}-#{year+1}"
    end
  end
end
