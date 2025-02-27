require "test_helper"

class ProductCategorySourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_category_source = product_category_sources(:one)
  end

  test "should get index" do
    get product_category_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_product_category_source_url
    assert_response :success
  end

  test "should create product_category_source" do
    assert_difference('ProductCategorySource.count') do
      post product_category_sources_url, params: { product_category_source: { code: @product_category_source.code, description: @product_category_source.description } }
    end

    assert_redirected_to product_category_source_url(ProductCategorySource.last)
  end

  test "should show product_category_source" do
    get product_category_source_url(@product_category_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_category_source_url(@product_category_source)
    assert_response :success
  end

  test "should update product_category_source" do
    patch product_category_source_url(@product_category_source), params: { product_category_source: { code: @product_category_source.code, description: @product_category_source.description } }
    assert_redirected_to product_category_source_url(@product_category_source)
  end

  test "should destroy product_category_source" do
    assert_difference('ProductCategorySource.count', -1) do
      delete product_category_source_url(@product_category_source)
    end

    assert_redirected_to product_category_sources_url
  end
end
