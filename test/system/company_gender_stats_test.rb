require "application_system_test_case"

class CompanyGenderStatsTest < ApplicationSystemTestCase
  setup do
    @company_gender_stat = company_gender_stats(:one)
  end

  test "visiting the index" do
    visit company_gender_stats_url
    assert_selector "h1", text: "Company Gender Stats"
  end

  test "creating a Company gender stat" do
    visit company_gender_stats_url
    click_on "New Company Gender Stat"

    fill_in "Company", with: @company_gender_stat.company_id
    fill_in "Count", with: @company_gender_stat.count
    fill_in "Employee type", with: @company_gender_stat.employee_type_id
    fill_in "Gender type", with: @company_gender_stat.gender_type_id
    fill_in "Percentage", with: @company_gender_stat.percentage
    click_on "Create Company gender stat"

    assert_text "Company gender stat was successfully created"
    click_on "Back"
  end

  test "updating a Company gender stat" do
    visit company_gender_stats_url
    click_on "Edit", match: :first

    fill_in "Company", with: @company_gender_stat.company_id
    fill_in "Count", with: @company_gender_stat.count
    fill_in "Employee type", with: @company_gender_stat.employee_type_id
    fill_in "Gender type", with: @company_gender_stat.gender_type_id
    fill_in "Percentage", with: @company_gender_stat.percentage
    click_on "Update Company gender stat"

    assert_text "Company gender stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Company gender stat" do
    visit company_gender_stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company gender stat was successfully destroyed"
  end
end
