class OrderitemsController < ApplicationController
  

  include Usercart
  before_action :set_cart, only: [:create , :destroy]
  before_action :set_orderitem, only: [:show, :edit, :update, :destroy]

  # GET /orderitems
  # GET /orderitems.json
  def index
    @orderitems = Orderitem.all
  end

  # GET /orderitems/1
  # GET /orderitems/1.json
  def show
  end
  
  # GET /orderitems/new
  def new
    @orderitem = Orderitem.new
  end

  # GET /orderitems/1/edit
  def edit
  end

  # POST /orderitems
  # POST /orderitems.json
  def create
     product = Product.find(params[:id])
   # @orderitem = @cart.orderitems.build(product: product)
      @orderitem = @cart.add_product(product)
    
    respond_to do |format|
      if
        @orderitem.save
        format.html { redirect_to @orderitem.cart, notice: 'Orderitem was successfully created.' }  
        format.json { render :show, status: :created, location: @orderitem }
      else
        format.html { render :new }
        format.json { render json: @orderitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderitems/1
  # PATCH/PUT /orderitems/1.json
  def update
    respond_to do |format|
      if @orderitem.update(orderitem_params)
        format.html { redirect_to @orderitems, notice: 'Orderitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @orderitem }
      else
        format.html { render :edit }
        format.json { render json: @orderitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderitems/1
  # DELETE /orderitems/1.json
  def destroy
    @orderitem.destroy
    respond_to do |format|
      format.html { redirect_to "/carts/#{@cart.id}", notice: 'Orderitem was successfully destroyed.' }   #orderitems_url
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderitem
      @orderitem = Orderitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orderitem_params
      params.require(:orderitem).permit(:id, :order_id, :product_id, :quantity, :subtotal)
    end
end
