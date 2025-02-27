require "application_system_test_case"

class ProductAttributesTest < ApplicationSystemTestCase
  setup do
    @product_attribute = product_attributes(:one)
  end

  test "visiting the index" do
    visit product_attributes_url
    assert_selector "h1", text: "Product Attributes"
  end

  test "creating a Product attribute" do
    visit product_attributes_url
    click_on "New Product Attribute"

    fill_in "Attribute", with: @product_attribute.attribute_id
    fill_in "Attribute value", with: @product_attribute.attribute_value_id
    fill_in "Brick", with: @product_attribute.brick_id
    fill_in "Company", with: @product_attribute.company_id
    fill_in "Product category source", with: @product_attribute.product_category_source_id
    fill_in "Product", with: @product_attribute.product_id
    click_on "Create Product attribute"

    assert_text "Product attribute was successfully created"
    click_on "Back"
  end

  test "updating a Product attribute" do
    visit product_attributes_url
    click_on "Edit", match: :first

    fill_in "Attribute", with: @product_attribute.attribute_id
    fill_in "Attribute value", with: @product_attribute.attribute_value_id
    fill_in "Brick", with: @product_attribute.brick_id
    fill_in "Company", with: @product_attribute.company_id
    fill_in "Product category source", with: @product_attribute.product_category_source_id
    fill_in "Product", with: @product_attribute.product_id
    click_on "Update Product attribute"

    assert_text "Product attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a Product attribute" do
    visit product_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product attribute was successfully destroyed"
  end
end
