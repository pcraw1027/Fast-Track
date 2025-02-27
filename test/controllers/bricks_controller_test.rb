require "test_helper"

class BricksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brick = bricks(:one)
  end

  test "should get index" do
    get bricks_url
    assert_response :success
  end

  test "should get new" do
    get new_brick_url
    assert_response :success
  end

  test "should create brick" do
    assert_difference('Brick.count') do
      post bricks_url, params: { brick: { code: @brick.code, description: @brick.description, klass_id: @brick.klass_id, product_category_source_id: @brick.product_category_source_id, title: @brick.title } }
    end

    assert_redirected_to brick_url(Brick.last)
  end

  test "should show brick" do
    get brick_url(@brick)
    assert_response :success
  end

  test "should get edit" do
    get edit_brick_url(@brick)
    assert_response :success
  end

  test "should update brick" do
    patch brick_url(@brick), params: { brick: { code: @brick.code, description: @brick.description, klass_id: @brick.klass_id, product_category_source_id: @brick.product_category_source_id, title: @brick.title } }
    assert_redirected_to brick_url(@brick)
  end

  test "should destroy brick" do
    assert_difference('Brick.count', -1) do
      delete brick_url(@brick)
    end

    assert_redirected_to bricks_url
  end
end
