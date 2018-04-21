class OrdersController < ApplicationController
 # include module Ensure_admin
 
 # before_filter :authenticate_user!
  #before_filter :ensure_admin, :only => [:new, :create, :edit, :destroy]
 # before_action :set_order, only: [:show, :edit, :update, :destroy]
   #include Usercart
    def set_cart
        @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
        @cart=Cart.create
        session[:cart_id]=@cart.id
    end
  before_action :set_cart, only: [:create , :destroy , :new , :show]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
   # @order=Order.find_by_user_id(current_user.id)
    @order = Order.find(session[:order_id])
  end

  # GET /orders/new
  def new
    @order = Order.new
    @user = User.new
    @address = Address.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    
    #@order.cart_id = @cart.id
    @order.user_id = current_user.id #session[:user_id]
    @order.add_orderitems(@cart)
    @order.total = @cart.cart_total
    respond_to do |format|
      if @order.save
        #need to check below line
        session[:order_id]=@order.id
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :salesTax, :shippingFee, :total, :methodOfPayment)
    end
end

