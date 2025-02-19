require "application_system_test_case"

class ProductCategorySourcesTest < ApplicationSystemTestCase
  setup do
    @product_category_source = product_category_sources(:one)
  end

  test "visiting the index" do
    visit product_category_sources_url
    assert_selector "h1", text: "Product Category Sources"
  end

  test "creating a Product category source" do
    visit product_category_sources_url
    click_on "New Product Category Source"

    fill_in "Code", with: @product_category_source.code
    fill_in "Description", with: @product_category_source.description
    click_on "Create Product category source"

    assert_text "Product category source was successfully created"
    click_on "Back"
  end

  test "updating a Product category source" do
    visit product_category_sources_url
    click_on "Edit", match: :first

    fill_in "Code", with: @product_category_source.code
    fill_in "Description", with: @product_category_source.description
    click_on "Update Product category source"

    assert_text "Product category source was successfully updated"
    click_on "Back"
  end

  test "destroying a Product category source" do
    visit product_category_sources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product category source was successfully destroyed"
  end
end
