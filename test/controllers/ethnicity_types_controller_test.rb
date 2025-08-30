require "test_helper"

class EthnicityTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ethnicity_type = ethnicity_types(:one)
  end

  test "should get index" do
    get ethnicity_types_url
    assert_response :success
  end

  test "should get new" do
    get new_ethnicity_type_url
    assert_response :success
  end

  test "should create ethnicity_type" do
    assert_difference('EthnicityType.count') do
      post ethnicity_types_url, 
params: { ethnicity_type: { definition: @ethnicity_type.definition, ethnicity: @ethnicity_type.ethnicity, 
source: @ethnicity_type.source } }
    end

    assert_redirected_to ethnicity_type_url(EthnicityType.last)
  end

  test "should show ethnicity_type" do
    get ethnicity_type_url(@ethnicity_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_ethnicity_type_url(@ethnicity_type)
    assert_response :success
  end

  test "should update ethnicity_type" do
    patch ethnicity_type_url(@ethnicity_type), 
params: { ethnicity_type: { definition: @ethnicity_type.definition, ethnicity: @ethnicity_type.ethnicity, 
source: @ethnicity_type.source } }
    assert_redirected_to ethnicity_type_url(@ethnicity_type)
  end

  test "should destroy ethnicity_type" do
    assert_difference('EthnicityType.count', -1) do
      delete ethnicity_type_url(@ethnicity_type)
    end

    assert_redirected_to ethnicity_types_url
  end
end
