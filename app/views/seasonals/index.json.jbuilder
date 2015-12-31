json.array!(@seasonals) do |seasonal|
  json.extract! seasonal, :id, :student_id, :year, :seasonal_type
  json.url seasonal_url(seasonal, format: :json)
end
