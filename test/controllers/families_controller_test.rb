require "test_helper"

class FamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family = families(:one)
  end

  test "should get index" do
    get families_url
    assert_response :success
  end

  test "should get new" do
    get new_family_url
    assert_response :success
  end

  test "should create family" do
    assert_difference('Family.count') do
      post families_url, params: { family: { code: @family.code, description: @family.description, product_category_source_id: @family.product_category_source_id, segment_id: @family.segment_id, title: @family.title } }
    end

    assert_redirected_to family_url(Family.last)
  end

  test "should show family" do
    get family_url(@family)
    assert_response :success
  end

  test "should get edit" do
    get edit_family_url(@family)
    assert_response :success
  end

  test "should update family" do
    patch family_url(@family), params: { family: { code: @family.code, description: @family.description, product_category_source_id: @family.product_category_source_id, segment_id: @family.segment_id, title: @family.title } }
    assert_redirected_to family_url(@family)
  end

  test "should destroy family" do
    assert_difference('Family.count', -1) do
      delete family_url(@family)
    end

    assert_redirected_to families_url
  end
end
