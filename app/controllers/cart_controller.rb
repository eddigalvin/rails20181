class CartController < ApplicationController
  def index
  end
  
  def show
 # @orderitems=current_order.orderitems
  end
  
  def add
    #@order = current_order
    #@order.save
    #@orderitem = @order.orderitems.new(params[:product_id])#(order_item_params)
    #@order.save
    #session[:order_id] = @order.id
    
     product_id = params[:id].at(-1).to_i
        cart = session[:cart] || {}
        cart[product_id] ? cart[product_id] += 1 : cart[product_id] = 1
        session[:cart] = cart
        
    
    #id=params[:id]
    #cart = session[:cart] ||= {}
    #cart[id] = (cart[id] || 0) + 1
    #@cart = session[:cart]
    redirect_to :action => :index #:index
  end
  
  def remove
    @order = current_order
    @orderitem = @order.Orderitem.find([params:id])
    @orderitem.destroy
    @orderitems = @order.orderitems
    #id=params[:id]
    #cart = session[:cart]
    #cart.delete[id]
    
    redirect_to :action => :index
  end
  
  def clear
   session[:cart] = nil
   redirect_to :action => :index
  end
  
  def order_item_params
      params.require(:orderitem).permit(:product_id) #(:order_id, :product_id, :quantity, :subtotal)
  end
  
end
