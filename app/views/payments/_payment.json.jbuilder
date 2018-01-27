json.extract! payment, :id, :student_id, :required_payment_id, :excused, :created_at, :updated_at
json.url payment_url(payment, format: :json)
