class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # include Usercart
   def set_cart
        @cart = Cart.find_by_id(session[:cart_id])
        #rescue ActiveRecord::RecordNotFound
        if @cart==nil
        @cart=Cart.create
        session[:cart_id]=@cart.id
        end
   end
  before_action :set_cart 
  
  before_action :configure_permitted_parameters, if: :devise_controller?

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_in, keys: [:fname, :email])
  devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname,:email, :phone, :password, :password_confirmation])
  devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :email, :password, :phone, :admin, :password_confirmation, :current_password])
  devise_parameter_sanitizer.permit(:home, keys: [:fname, :email])
  #  devise_parameter_sanitizer.permit(:products, keys: [:cart_total]) 
  # devise_parameter_sanitizer.permit(:new, keys: [:fname, :email, :password, :phone, :admin])
end

  helper_method :current_user
  
  
  helper_method :current_order
  
  def current_order
  if !session[:order_id].nil?
        Order.find(session[:order_id])
    else
      Order.new
  end
  end
  
end
