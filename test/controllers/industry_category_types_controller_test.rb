require "test_helper"

class IndustryCategoryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @industry_category_type = industry_category_types(:one)
  end

  test "should get index" do
    get industry_category_types_url
    assert_response :success
  end

  test "should get new" do
    get new_industry_category_type_url
    assert_response :success
  end

  test "should create industry_category_type" do
    assert_difference('IndustryCategoryType.count') do
      post industry_category_types_url, params: { industry_category_type: { category_type: @industry_category_type.category_type, definition: @industry_category_type.definition } }
    end

    assert_redirected_to industry_category_type_url(IndustryCategoryType.last)
  end

  test "should show industry_category_type" do
    get industry_category_type_url(@industry_category_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_industry_category_type_url(@industry_category_type)
    assert_response :success
  end

  test "should update industry_category_type" do
    patch industry_category_type_url(@industry_category_type), params: { industry_category_type: { category_type: @industry_category_type.category_type, definition: @industry_category_type.definition } }
    assert_redirected_to industry_category_type_url(@industry_category_type)
  end

  test "should destroy industry_category_type" do
    assert_difference('IndustryCategoryType.count', -1) do
      delete industry_category_type_url(@industry_category_type)
    end

    assert_redirected_to industry_category_types_url
  end
end
