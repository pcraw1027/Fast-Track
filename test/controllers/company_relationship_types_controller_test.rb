require "test_helper"

class CompanyRelationshipTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_relationship_type = company_relationship_types(:one)
  end

  test "should get index" do
    get company_relationship_types_url
    assert_response :success
  end

  test "should get new" do
    get new_company_relationship_type_url
    assert_response :success
  end

  test "should create company_relationship_type" do
    assert_difference('CompanyRelationshipType.count') do
      post company_relationship_types_url, 
params: { company_relationship_type: { definition: @company_relationship_type.definition, 
relationship: @company_relationship_type.relationship } }
    end

    assert_redirected_to company_relationship_type_url(CompanyRelationshipType.last)
  end

  test "should show company_relationship_type" do
    get company_relationship_type_url(@company_relationship_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_relationship_type_url(@company_relationship_type)
    assert_response :success
  end

  test "should update company_relationship_type" do
    patch company_relationship_type_url(@company_relationship_type), 
params: { company_relationship_type: { definition: @company_relationship_type.definition, 
relationship: @company_relationship_type.relationship } }
    assert_redirected_to company_relationship_type_url(@company_relationship_type)
  end

  test "should destroy company_relationship_type" do
    assert_difference('CompanyRelationshipType.count', -1) do
      delete company_relationship_type_url(@company_relationship_type)
    end

    assert_redirected_to company_relationship_types_url
  end
end
