json.extract! parent, :id, :first_name, :last_name, :email, :phone, :preferred_language, :created_at, :updated_at
json.url parent_url(parent, format: :json)
