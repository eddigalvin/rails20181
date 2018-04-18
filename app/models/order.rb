class Order < ApplicationRecord
    belongs_to :user
    has_many :orderitems
    
    def add_orderitems(cart)
        cart.orderitems.each do |item|
        item.cart_id = nil
        orderitems<<item
        end
    end    
end
