json.extract! order, :id, :user_id, :salesTax, :shippingFee, :total, :methodOfPayment, :created_at, :updated_at
json.url order_url(order, format: :json)
