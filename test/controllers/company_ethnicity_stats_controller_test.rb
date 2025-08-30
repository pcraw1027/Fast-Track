require "test_helper"

class CompanyEthnicityStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_ethnicity_stat = company_ethnicity_stats(:one)
  end

  test "should get index" do
    get company_ethnicity_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_company_ethnicity_stat_url
    assert_response :success
  end

  test "should create company_ethnicity_stat" do
    assert_difference('CompanyEthnicityStat.count') do
      post company_ethnicity_stats_url, 
params: { company_ethnicity_stat: { company_id: @company_ethnicity_stat.company_id, 
count: @company_ethnicity_stat.count, employee_type_id: @company_ethnicity_stat.employee_type_id, ethnicity_type_id: @company_ethnicity_stat.ethnicity_type_id, percentage: @company_ethnicity_stat.percentage } }
    end

    assert_redirected_to company_ethnicity_stat_url(CompanyEthnicityStat.last)
  end

  test "should show company_ethnicity_stat" do
    get company_ethnicity_stat_url(@company_ethnicity_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_ethnicity_stat_url(@company_ethnicity_stat)
    assert_response :success
  end

  test "should update company_ethnicity_stat" do
    patch company_ethnicity_stat_url(@company_ethnicity_stat), 
params: { company_ethnicity_stat: { company_id: @company_ethnicity_stat.company_id, 
count: @company_ethnicity_stat.count, employee_type_id: @company_ethnicity_stat.employee_type_id, ethnicity_type_id: @company_ethnicity_stat.ethnicity_type_id, percentage: @company_ethnicity_stat.percentage } }
    assert_redirected_to company_ethnicity_stat_url(@company_ethnicity_stat)
  end

  test "should destroy company_ethnicity_stat" do
    assert_difference('CompanyEthnicityStat.count', -1) do
      delete company_ethnicity_stat_url(@company_ethnicity_stat)
    end

    assert_redirected_to company_ethnicity_stats_url
  end
end
