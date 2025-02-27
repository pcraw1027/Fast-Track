require "application_system_test_case"

class IndustryCategoryTypesTest < ApplicationSystemTestCase
  setup do
    @industry_category_type = industry_category_types(:one)
  end

  test "visiting the index" do
    visit industry_category_types_url
    assert_selector "h1", text: "Industry Category Types"
  end

  test "creating a Industry category type" do
    visit industry_category_types_url
    click_on "New Industry Category Type"

    fill_in "Category type", with: @industry_category_type.category_type
    fill_in "Definition", with: @industry_category_type.definition
    click_on "Create Industry category type"

    assert_text "Industry category type was successfully created"
    click_on "Back"
  end

  test "updating a Industry category type" do
    visit industry_category_types_url
    click_on "Edit", match: :first

    fill_in "Category type", with: @industry_category_type.category_type
    fill_in "Definition", with: @industry_category_type.definition
    click_on "Update Industry category type"

    assert_text "Industry category type was successfully updated"
    click_on "Back"
  end

  test "destroying a Industry category type" do
    visit industry_category_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Industry category type was successfully destroyed"
  end
end
