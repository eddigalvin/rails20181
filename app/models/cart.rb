class Cart < ApplicationRecord
    has_many :orderitems
    has_many :products, through: :orderitems
    
    def add_product(product)
        current_item = orderitems.find_by(product_id: product.id)
        if current_item
         if   current_item.quantity == nil
              current_item.quantity = 1
         end
          current_item.quantity +=1
          current_item.subtotal = product.vatprice*current_item.quantity
        else
            current_item = orderitems.build(product_id: product.id);
            current_item.quantity = 1
            current_item.subtotal = product.vatprice
        end
        current_item
    end
    
    def cart_total
        orderitems.to_a.sum{|orderitem| orderitem.subtotal}
    end
end
