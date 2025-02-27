require "application_system_test_case"

class AttributeValuesTest < ApplicationSystemTestCase
  setup do
    @attribute_value = attribute_values(:one)
  end

  test "visiting the index" do
    visit attribute_values_url
    assert_selector "h1", text: "Attribute Values"
  end

  test "creating a Attribute value" do
    visit attribute_values_url
    click_on "New Attribute Value"

    fill_in "Code", with: @attribute_value.code
    fill_in "Description", with: @attribute_value.description
    fill_in "Product category source", with: @attribute_value.product_category_source_id
    fill_in "Title", with: @attribute_value.title
    click_on "Create Attribute value"

    assert_text "Attribute value was successfully created"
    click_on "Back"
  end

  test "updating a Attribute value" do
    visit attribute_values_url
    click_on "Edit", match: :first

    fill_in "Code", with: @attribute_value.code
    fill_in "Description", with: @attribute_value.description
    fill_in "Product category source", with: @attribute_value.product_category_source_id
    fill_in "Title", with: @attribute_value.title
    click_on "Update Attribute value"

    assert_text "Attribute value was successfully updated"
    click_on "Back"
  end

  test "destroying a Attribute value" do
    visit attribute_values_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attribute value was successfully destroyed"
  end
end
