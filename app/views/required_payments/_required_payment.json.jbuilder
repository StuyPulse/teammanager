json.extract! required_payment, :id, :trip_id, :type, :amount, :created_at, :updated_at
json.url required_payment_url(required_payment, format: :json)
