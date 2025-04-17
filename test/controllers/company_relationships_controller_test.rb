require "test_helper"

class CompanyRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_relationship = company_relationships(:one)
  end

  test "should get index" do
    get company_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_company_relationship_url
    assert_response :success
  end

  test "should create company_relationship" do
    assert_difference('CompanyRelationship.count') do
      post company_relationships_url, params: { company_relationship: { child_company_id: @company_relationship.child_company_id, company_relationship_type_id: @company_relationship.company_relationship_type_id, parent_company_id: @company_relationship.parent_company_id } }
    end

    assert_redirected_to company_relationship_url(CompanyRelationship.last)
  end

  test "should show company_relationship" do
    get company_relationship_url(@company_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_relationship_url(@company_relationship)
    assert_response :success
  end

  test "should update company_relationship" do
    patch company_relationship_url(@company_relationship), params: { company_relationship: { child_company_id: @company_relationship.child_company_id, company_relationship_type_id: @company_relationship.company_relationship_type_id, parent_company_id: @company_relationship.parent_company_id } }
    assert_redirected_to company_relationship_url(@company_relationship)
  end

  test "should destroy company_relationship" do
    assert_difference('CompanyRelationship.count', -1) do
      delete company_relationship_url(@company_relationship)
    end

    assert_redirected_to company_relationships_url
  end
end
