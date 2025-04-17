require "test_helper"

class KlassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @klass = klasses(:one)
  end

  test "should get index" do
    get klasses_url
    assert_response :success
  end

  test "should get new" do
    get new_klass_url
    assert_response :success
  end

  test "should create klass" do
    assert_difference('Klass.count') do
      post klasses_url, params: { klass: { code: @klass.code, description: @klass.description, family_id: @klass.family_id, product_category_source_id: @klass.product_category_source_id, title: @klass.title } }
    end

    assert_redirected_to klass_url(Klass.last)
  end

  test "should show klass" do
    get klass_url(@klass)
    assert_response :success
  end

  test "should get edit" do
    get edit_klass_url(@klass)
    assert_response :success
  end

  test "should update klass" do
    patch klass_url(@klass), params: { klass: { code: @klass.code, description: @klass.description, family_id: @klass.family_id, product_category_source_id: @klass.product_category_source_id, title: @klass.title } }
    assert_redirected_to klass_url(@klass)
  end

  test "should destroy klass" do
    assert_difference('Klass.count', -1) do
      delete klass_url(@klass)
    end

    assert_redirected_to klasses_url
  end
end
