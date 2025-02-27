require "application_system_test_case"

class GenderTypesTest < ApplicationSystemTestCase
  setup do
    @gender_type = gender_types(:one)
  end

  test "visiting the index" do
    visit gender_types_url
    assert_selector "h1", text: "Gender Types"
  end

  test "creating a Gender type" do
    visit gender_types_url
    click_on "New Gender Type"

    fill_in "Definition", with: @gender_type.definition
    fill_in "Gender", with: @gender_type.gender
    click_on "Create Gender type"

    assert_text "Gender type was successfully created"
    click_on "Back"
  end

  test "updating a Gender type" do
    visit gender_types_url
    click_on "Edit", match: :first

    fill_in "Definition", with: @gender_type.definition
    fill_in "Gender", with: @gender_type.gender
    click_on "Update Gender type"

    assert_text "Gender type was successfully updated"
    click_on "Back"
  end

  test "destroying a Gender type" do
    visit gender_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gender type was successfully destroyed"
  end
end
