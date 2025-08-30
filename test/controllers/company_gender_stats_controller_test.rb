require "test_helper"

class CompanyGenderStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_gender_stat = company_gender_stats(:one)
  end

  test "should get index" do
    get company_gender_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_company_gender_stat_url
    assert_response :success
  end

  test "should create company_gender_stat" do
    assert_difference('CompanyGenderStat.count') do
      post company_gender_stats_url, 
params: { company_gender_stat: { company_id: @company_gender_stat.company_id, count: @company_gender_stat.count, 
employee_type_id: @company_gender_stat.employee_type_id, gender_type_id: @company_gender_stat.gender_type_id, percentage: @company_gender_stat.percentage } }
    end

    assert_redirected_to company_gender_stat_url(CompanyGenderStat.last)
  end

  test "should show company_gender_stat" do
    get company_gender_stat_url(@company_gender_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_gender_stat_url(@company_gender_stat)
    assert_response :success
  end

  test "should update company_gender_stat" do
    patch company_gender_stat_url(@company_gender_stat), 
params: { company_gender_stat: { company_id: @company_gender_stat.company_id, count: @company_gender_stat.count, 
employee_type_id: @company_gender_stat.employee_type_id, gender_type_id: @company_gender_stat.gender_type_id, percentage: @company_gender_stat.percentage } }
    assert_redirected_to company_gender_stat_url(@company_gender_stat)
  end

  test "should destroy company_gender_stat" do
    assert_difference('CompanyGenderStat.count', -1) do
      delete company_gender_stat_url(@company_gender_stat)
    end

    assert_redirected_to company_gender_stats_url
  end
end
