require "application_system_test_case"

class CompanyRelationshipTypesTest < ApplicationSystemTestCase
  setup do
    @company_relationship_type = company_relationship_types(:one)
  end

  test "visiting the index" do
    visit company_relationship_types_url
    assert_selector "h1", text: "Company Relationship Types"
  end

  test "creating a Company relationship type" do
    visit company_relationship_types_url
    click_on "New Company Relationship Type"

    fill_in "Definition", with: @company_relationship_type.definition
    fill_in "Relationship", with: @company_relationship_type.relationship
    click_on "Create Company relationship type"

    assert_text "Company relationship type was successfully created"
    click_on "Back"
  end

  test "updating a Company relationship type" do
    visit company_relationship_types_url
    click_on "Edit", match: :first

    fill_in "Definition", with: @company_relationship_type.definition
    fill_in "Relationship", with: @company_relationship_type.relationship
    click_on "Update Company relationship type"

    assert_text "Company relationship type was successfully updated"
    click_on "Back"
  end

  test "destroying a Company relationship type" do
    visit company_relationship_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company relationship type was successfully destroyed"
  end
end
