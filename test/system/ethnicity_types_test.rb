require "application_system_test_case"

class EthnicityTypesTest < ApplicationSystemTestCase
  setup do
    @ethnicity_type = ethnicity_types(:one)
  end

  test "visiting the index" do
    visit ethnicity_types_url
    assert_selector "h1", text: "Ethnicity Types"
  end

  test "creating a Ethnicity type" do
    visit ethnicity_types_url
    click_on "New Ethnicity Type"

    fill_in "Definition", with: @ethnicity_type.definition
    fill_in "Ethnicity", with: @ethnicity_type.ethnicity
    fill_in "Source", with: @ethnicity_type.source
    click_on "Create Ethnicity type"

    assert_text "Ethnicity type was successfully created"
    click_on "Back"
  end

  test "updating a Ethnicity type" do
    visit ethnicity_types_url
    click_on "Edit", match: :first

    fill_in "Definition", with: @ethnicity_type.definition
    fill_in "Ethnicity", with: @ethnicity_type.ethnicity
    fill_in "Source", with: @ethnicity_type.source
    click_on "Update Ethnicity type"

    assert_text "Ethnicity type was successfully updated"
    click_on "Back"
  end

  test "destroying a Ethnicity type" do
    visit ethnicity_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ethnicity type was successfully destroyed"
  end
end
