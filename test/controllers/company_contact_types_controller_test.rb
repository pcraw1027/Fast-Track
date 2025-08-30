require "test_helper"

class CompanyContactTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_contact_type = company_contact_types(:one)
  end

  test "should get index" do
    get company_contact_types_url
    assert_response :success
  end

  test "should get new" do
    get new_company_contact_type_url
    assert_response :success
  end

  test "should create company_contact_type" do
    assert_difference('CompanyContactType.count') do
      post company_contact_types_url, 
params: { company_contact_type: { definition: @company_contact_type.definition, role: @company_contact_type.role } }
    end

    assert_redirected_to company_contact_type_url(CompanyContactType.last)
  end

  test "should show company_contact_type" do
    get company_contact_type_url(@company_contact_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_contact_type_url(@company_contact_type)
    assert_response :success
  end

  test "should update company_contact_type" do
    patch company_contact_type_url(@company_contact_type), 
params: { company_contact_type: { definition: @company_contact_type.definition, role: @company_contact_type.role } }
    assert_redirected_to company_contact_type_url(@company_contact_type)
  end

  test "should destroy company_contact_type" do
    assert_difference('CompanyContactType.count', -1) do
      delete company_contact_type_url(@company_contact_type)
    end

    assert_redirected_to company_contact_types_url
  end
end
