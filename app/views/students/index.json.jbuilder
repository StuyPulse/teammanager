json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :graduation_year, :osis, :sark, :email, :phone
  json.url student_url(student, format: :json)
end
