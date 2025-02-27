require "application_system_test_case"

class BricksTest < ApplicationSystemTestCase
  setup do
    @brick = bricks(:one)
  end

  test "visiting the index" do
    visit bricks_url
    assert_selector "h1", text: "Bricks"
  end

  test "creating a Brick" do
    visit bricks_url
    click_on "New Brick"

    fill_in "Code", with: @brick.code
    fill_in "Description", with: @brick.description
    fill_in "Klass", with: @brick.klass_id
    fill_in "Product category source", with: @brick.product_category_source_id
    fill_in "Title", with: @brick.title
    click_on "Create Brick"

    assert_text "Brick was successfully created"
    click_on "Back"
  end

  test "updating a Brick" do
    visit bricks_url
    click_on "Edit", match: :first

    fill_in "Code", with: @brick.code
    fill_in "Description", with: @brick.description
    fill_in "Klass", with: @brick.klass_id
    fill_in "Product category source", with: @brick.product_category_source_id
    fill_in "Title", with: @brick.title
    click_on "Update Brick"

    assert_text "Brick was successfully updated"
    click_on "Back"
  end

  test "destroying a Brick" do
    visit bricks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brick was successfully destroyed"
  end
end
