require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Barcode", with: @product.barcode
    fill_in "Brick", with: @product.brick_id
    fill_in "Company", with: @product.company_id
    fill_in "Description", with: @product.description
    fill_in "Family", with: @product.family_id
    fill_in "Image", with: @product.image
    fill_in "Klass", with: @product.klass_id
    fill_in "Name", with: @product.name
    fill_in "Qrcode", with: @product.qrcode
    fill_in "Segment", with: @product.segment_id
    fill_in "Size", with: @product.size
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Barcode", with: @product.barcode
    fill_in "Brick", with: @product.brick_id
    fill_in "Company", with: @product.company_id
    fill_in "Description", with: @product.description
    fill_in "Family", with: @product.family_id
    fill_in "Image", with: @product.image
    fill_in "Klass", with: @product.klass_id
    fill_in "Name", with: @product.name
    fill_in "Qrcode", with: @product.qrcode
    fill_in "Segment", with: @product.segment_id
    fill_in "Size", with: @product.size
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
