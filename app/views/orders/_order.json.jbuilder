json.extract! order, :id, :order_id, :order_date, :order_subtotal, :order_tax_rate, :order_total, :order_state, :order_address, :order_postal_code, :order_province, :order_tracking_number, :created_at, :updated_at
json.url order_url(order, format: :json)
