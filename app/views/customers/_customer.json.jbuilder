json.extract! customer, :id, :customer_id, :first_name, :last_name, :title, :email, :password_digest, :created_at, :updated_at
json.url customer_url(customer, format: :json)
