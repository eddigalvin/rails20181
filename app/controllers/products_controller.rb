class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

# GET /products by manu
  def showbymanu
    #man="Hp"#params[:Manu]
  @products=Product.where(params[:Manu])
  end
  # GET /products by price range
  def showbyprice
   # vprice=params[:Vatprice]'#{vprice}'  params[:Vatprice].to_i
   number=params[:Vatprice].delete("^0-9.").to_d
   #[ /\$\s*(\d+\.\d+)/, 1 ].to_d#.match(/\d+\.\d+/)[0]
  @products=Product.where(["Vatprice>?",number])
  end
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @orderitem = current_order.orderitems.new
    if params[:search]
      @products = Product.search(params[:search])
    else
      return Product.all
    end
  end
  
  

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #private
    # Use callbacks to share common setup or constraints between actions.
     def set_product
      @product = Product.find(params[:id])
     end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :manu, :model, :desc, :procname, :proc_id, :memsize, :mem_id, :hdtype, :hdsize, :hd_id, :osname, :os_id, :vatprice, :image_url)
    end
end
