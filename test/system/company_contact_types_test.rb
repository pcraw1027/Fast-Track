require "application_system_test_case"

class CompanyContactTypesTest < ApplicationSystemTestCase
  setup do
    @company_contact_type = company_contact_types(:one)
  end

  test "visiting the index" do
    visit company_contact_types_url
    assert_selector "h1", text: "Company Contact Types"
  end

  test "creating a Company contact type" do
    visit company_contact_types_url
    click_on "New Company Contact Type"

    fill_in "Definition", with: @company_contact_type.definition
    fill_in "Role", with: @company_contact_type.role
    click_on "Create Company contact type"

    assert_text "Company contact type was successfully created"
    click_on "Back"
  end

  test "updating a Company contact type" do
    visit company_contact_types_url
    click_on "Edit", match: :first

    fill_in "Definition", with: @company_contact_type.definition
    fill_in "Role", with: @company_contact_type.role
    click_on "Update Company contact type"

    assert_text "Company contact type was successfully updated"
    click_on "Back"
  end

  test "destroying a Company contact type" do
    visit company_contact_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company contact type was successfully destroyed"
  end
end
