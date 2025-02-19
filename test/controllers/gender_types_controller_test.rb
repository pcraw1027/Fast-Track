require "test_helper"

class GenderTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gender_type = gender_types(:one)
  end

  test "should get index" do
    get gender_types_url
    assert_response :success
  end

  test "should get new" do
    get new_gender_type_url
    assert_response :success
  end

  test "should create gender_type" do
    assert_difference('GenderType.count') do
      post gender_types_url, params: { gender_type: { definition: @gender_type.definition, gender: @gender_type.gender } }
    end

    assert_redirected_to gender_type_url(GenderType.last)
  end

  test "should show gender_type" do
    get gender_type_url(@gender_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_gender_type_url(@gender_type)
    assert_response :success
  end

  test "should update gender_type" do
    patch gender_type_url(@gender_type), params: { gender_type: { definition: @gender_type.definition, gender: @gender_type.gender } }
    assert_redirected_to gender_type_url(@gender_type)
  end

  test "should destroy gender_type" do
    assert_difference('GenderType.count', -1) do
      delete gender_type_url(@gender_type)
    end

    assert_redirected_to gender_types_url
  end
end
