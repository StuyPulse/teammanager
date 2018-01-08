json.extract! event, :id, :name, :description, :date, :valid_year, :default_hours, :created_at, :updated_at
json.url event_url(event, format: :json)
