require "test_helper"

class AttributeTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attribute_title = attribute_titles(:one)
  end

  test "should get index" do
    get attribute_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_attribute_title_url
    assert_response :success
  end

  test "should create attribute_title" do
    assert_difference('AttributeTitle.count') do
      post attribute_titles_url, 
params: { attribute_title: { code: @attribute_title.code, description: @attribute_title.description, 
product_category_source_id: @attribute_title.product_category_source_id, title: @attribute_title.title } }
    end

    assert_redirected_to attribute_title_url(AttributeTitle.last)
  end

  test "should show attribute_title" do
    get attribute_title_url(@attribute_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_attribute_title_url(@attribute_title)
    assert_response :success
  end

  test "should update attribute_title" do
    patch attribute_title_url(@attribute_title), 
params: { attribute_title: { code: @attribute_title.code, description: @attribute_title.description, 
product_category_source_id: @attribute_title.product_category_source_id, title: @attribute_title.title } }
    assert_redirected_to attribute_title_url(@attribute_title)
  end

  test "should destroy attribute_title" do
    assert_difference('AttributeTitle.count', -1) do
      delete attribute_title_url(@attribute_title)
    end

    assert_redirected_to attribute_titles_url
  end
end
