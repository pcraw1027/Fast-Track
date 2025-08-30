require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, 
params: { company: { address_1: @company.address_1, address_2: @company.address_2, city: @company.city, 
country: @company.country, diversity_report: @company.diversity_report, diversity_score: @company.diversity_score, established: @company.established, industry_category_type_id: @company.industry_category_type_id, logo: @company.logo, name: @company.name, state: @company.state, total_employees: @company.total_employees, website: @company.website } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), 
params: { company: { address_1: @company.address_1, address_2: @company.address_2, city: @company.city, 
country: @company.country, diversity_report: @company.diversity_report, diversity_score: @company.diversity_score, established: @company.established, industry_category_type_id: @company.industry_category_type_id, logo: @company.logo, name: @company.name, state: @company.state, total_employees: @company.total_employees, website: @company.website } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
