module Usercart
    private
    def set_cart
        @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
        @cart=Cart.create
        session[:cartid]=@cart.id
    end
end