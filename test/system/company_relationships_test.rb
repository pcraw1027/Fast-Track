require "application_system_test_case"

class CompanyRelationshipsTest < ApplicationSystemTestCase
  setup do
    @company_relationship = company_relationships(:one)
  end

  test "visiting the index" do
    visit company_relationships_url
    assert_selector "h1", text: "Company Relationships"
  end

  test "creating a Company relationship" do
    visit company_relationships_url
    click_on "New Company Relationship"

    fill_in "Child company", with: @company_relationship.child_company_id
    fill_in "Company relationship type", with: @company_relationship.company_relationship_type_id
    fill_in "Parent company", with: @company_relationship.parent_company_id
    click_on "Create Company relationship"

    assert_text "Company relationship was successfully created"
    click_on "Back"
  end

  test "updating a Company relationship" do
    visit company_relationships_url
    click_on "Edit", match: :first

    fill_in "Child company", with: @company_relationship.child_company_id
    fill_in "Company relationship type", with: @company_relationship.company_relationship_type_id
    fill_in "Parent company", with: @company_relationship.parent_company_id
    click_on "Update Company relationship"

    assert_text "Company relationship was successfully updated"
    click_on "Back"
  end

  test "destroying a Company relationship" do
    visit company_relationships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company relationship was successfully destroyed"
  end
end
