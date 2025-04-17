require "test_helper"

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
      post products_url, params: { product: { barcode: @product.barcode, brick_id: @product.brick_id, company_id: @product.company_id, description: @product.description, family_id: @product.family_id, image: @product.image, klass_id: @product.klass_id, name: @product.name, qrcode: @product.qrcode, segment_id: @product.segment_id, size: @product.size } }
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
    patch product_url(@product), params: { product: { barcode: @product.barcode, brick_id: @product.brick_id, company_id: @product.company_id, description: @product.description, family_id: @product.family_id, image: @product.image, klass_id: @product.klass_id, name: @product.name, qrcode: @product.qrcode, segment_id: @product.segment_id, size: @product.size } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
