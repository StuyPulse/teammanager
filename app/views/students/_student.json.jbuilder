json.extract! student, :id, :first_name, :last_name, :preferred_name, :grad_year, :osis, :personal_email, :phone, :team_id, :created_at, :updated_at
json.url student_url(student, format: :json)
