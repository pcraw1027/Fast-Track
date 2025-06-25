require "application_system_test_case"

class CountryReferencesTest < ApplicationSystemTestCase
  setup do
    @country_reference = country_references(:one)
  end

  test "visiting the index" do
    visit country_references_url
    assert_selector "h1", text: "Country References"
  end

  test "creating a Country reference" do
    visit country_references_url
    click_on "New Country Reference"

    fill_in "Country", with: @country_reference.country
    fill_in "Country code", with: @country_reference.country_code
    click_on "Create Country reference"

    assert_text "Country reference was successfully created"
    click_on "Back"
  end

  test "updating a Country reference" do
    visit country_references_url
    click_on "Edit", match: :first

    fill_in "Country", with: @country_reference.country
    fill_in "Country code", with: @country_reference.country_code
    click_on "Update Country reference"

    assert_text "Country reference was successfully updated"
    click_on "Back"
  end

  test "destroying a Country reference" do
    visit country_references_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Country reference was successfully destroyed"
  end
end
