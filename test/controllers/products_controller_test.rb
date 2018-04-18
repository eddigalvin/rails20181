require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { desc: @product.desc, hd_id: @product.hd_id, hdsize: @product.hdsize, hdtype: @product.hdtype, image_url: @product.image_url, manu: @product.manu, mem_id: @product.mem_id, memsize: @product.memsize, model: @product.model, name: @product.name, os_id: @product.os_id, osname: @product.osname, proc_id: @product.proc_id, procname: @product.procname, vatprice: @product.vatprice } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { desc: @product.desc, hd_id: @product.hd_id, hdsize: @product.hdsize, hdtype: @product.hdtype, image_url: @product.image_url, manu: @product.manu, mem_id: @product.mem_id, memsize: @product.memsize, model: @product.model, name: @product.name, os_id: @product.os_id, osname: @product.osname, proc_id: @product.proc_id, procname: @product.procname, vatprice: @product.vatprice } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
