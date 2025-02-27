require "application_system_test_case"

class AttributeTitlesTest < ApplicationSystemTestCase
  setup do
    @attribute_title = attribute_titles(:one)
  end

  test "visiting the index" do
    visit attribute_titles_url
    assert_selector "h1", text: "Attribute Titles"
  end

  test "creating a Attribute title" do
    visit attribute_titles_url
    click_on "New Attribute Title"

    fill_in "Code", with: @attribute_title.code
    fill_in "Description", with: @attribute_title.description
    fill_in "Product category source", with: @attribute_title.product_category_source_id
    fill_in "Title", with: @attribute_title.title
    click_on "Create Attribute title"

    assert_text "Attribute title was successfully created"
    click_on "Back"
  end

  test "updating a Attribute title" do
    visit attribute_titles_url
    click_on "Edit", match: :first

    fill_in "Code", with: @attribute_title.code
    fill_in "Description", with: @attribute_title.description
    fill_in "Product category source", with: @attribute_title.product_category_source_id
    fill_in "Title", with: @attribute_title.title
    click_on "Update Attribute title"

    assert_text "Attribute title was successfully updated"
    click_on "Back"
  end

  test "destroying a Attribute title" do
    visit attribute_titles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attribute title was successfully destroyed"
  end
end
