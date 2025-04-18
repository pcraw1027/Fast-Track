require "application_system_test_case"

class SegmentsTest < ApplicationSystemTestCase
  setup do
    @segment = segments(:one)
  end

  test "visiting the index" do
    visit segments_url
    assert_selector "h1", text: "Segments"
  end

  test "creating a Segment" do
    visit segments_url
    click_on "New Segment"

    fill_in "Code", with: @segment.code
    fill_in "Description", with: @segment.description
    fill_in "Product category source", with: @segment.product_category_source_id
    fill_in "Title", with: @segment.title
    click_on "Create Segment"

    assert_text "Segment was successfully created"
    click_on "Back"
  end

  test "updating a Segment" do
    visit segments_url
    click_on "Edit", match: :first

    fill_in "Code", with: @segment.code
    fill_in "Description", with: @segment.description
    fill_in "Product category source", with: @segment.product_category_source_id
    fill_in "Title", with: @segment.title
    click_on "Update Segment"

    assert_text "Segment was successfully updated"
    click_on "Back"
  end

  test "destroying a Segment" do
    visit segments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Segment was successfully destroyed"
  end
end
