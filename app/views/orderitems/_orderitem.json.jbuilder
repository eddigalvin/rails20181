json.extract! orderitem, :id, :order_id, :product_id, :quantity, :subtotal, :created_at, :updated_at
json.url orderitem_url(orderitem, format: :json)
