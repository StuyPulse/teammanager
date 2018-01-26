json.extract! trip, :id, :name, :requires_teacher_permission, :created_at, :updated_at
json.url trip_url(trip, format: :json)
