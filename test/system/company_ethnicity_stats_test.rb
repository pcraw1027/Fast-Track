require "application_system_test_case"

class CompanyEthnicityStatsTest < ApplicationSystemTestCase
  setup do
    @company_ethnicity_stat = company_ethnicity_stats(:one)
  end

  test "visiting the index" do
    visit company_ethnicity_stats_url
    assert_selector "h1", text: "Company Ethnicity Stats"
  end

  test "creating a Company ethnicity stat" do
    visit company_ethnicity_stats_url
    click_on "New Company Ethnicity Stat"

    fill_in "Company", with: @company_ethnicity_stat.company_id
    fill_in "Count", with: @company_ethnicity_stat.count
    fill_in "Employee type", with: @company_ethnicity_stat.employee_type_id
    fill_in "Ethnicity type", with: @company_ethnicity_stat.ethnicity_type_id
    fill_in "Percentage", with: @company_ethnicity_stat.percentage
    click_on "Create Company ethnicity stat"

    assert_text "Company ethnicity stat was successfully created"
    click_on "Back"
  end

  test "updating a Company ethnicity stat" do
    visit company_ethnicity_stats_url
    click_on "Edit", match: :first

    fill_in "Company", with: @company_ethnicity_stat.company_id
    fill_in "Count", with: @company_ethnicity_stat.count
    fill_in "Employee type", with: @company_ethnicity_stat.employee_type_id
    fill_in "Ethnicity type", with: @company_ethnicity_stat.ethnicity_type_id
    fill_in "Percentage", with: @company_ethnicity_stat.percentage
    click_on "Update Company ethnicity stat"

    assert_text "Company ethnicity stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Company ethnicity stat" do
    visit company_ethnicity_stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company ethnicity stat was successfully destroyed"
  end
end
