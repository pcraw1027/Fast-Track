require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "creating a Company" do
    visit companies_url
    click_on "New Company"

    fill_in "Address 1", with: @company.address_1
    fill_in "Address 2", with: @company.address_2
    fill_in "City", with: @company.city
    fill_in "Country", with: @company.country
    fill_in "Diversity report", with: @company.diversity_report
    fill_in "Diversity score", with: @company.diversity_score
    fill_in "Established", with: @company.established
    fill_in "Industry category type", with: @company.industry_category_type_id
    fill_in "Logo", with: @company.logo
    fill_in "Name", with: @company.name
    fill_in "State", with: @company.state
    fill_in "Total employees", with: @company.total_employees
    fill_in "Website", with: @company.website
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "updating a Company" do
    visit companies_url
    click_on "Edit", match: :first

    fill_in "Address 1", with: @company.address_1
    fill_in "Address 2", with: @company.address_2
    fill_in "City", with: @company.city
    fill_in "Country", with: @company.country
    fill_in "Diversity report", with: @company.diversity_report
    fill_in "Diversity score", with: @company.diversity_score
    fill_in "Established", with: @company.established
    fill_in "Industry category type", with: @company.industry_category_type_id
    fill_in "Logo", with: @company.logo
    fill_in "Name", with: @company.name
    fill_in "State", with: @company.state
    fill_in "Total employees", with: @company.total_employees
    fill_in "Website", with: @company.website
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "destroying a Company" do
    visit companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end
