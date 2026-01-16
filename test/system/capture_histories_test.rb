require "application_system_test_case"

class CaptureHistoriesTest < ApplicationSystemTestCase
  setup do
    @capture_history = capture_histories(:one)
  end

  test "visiting the index" do
    visit capture_histories_url
    assert_selector "h1", text: "Capture Histories"
  end

  test "creating a Capture history" do
    visit capture_histories_url
    click_on "New Capture History"

    fill_in "Barcode", with: @capture_history.barcode
    fill_in "Name", with: @capture_history.name
    fill_in "Status", with: @capture_history.status
    fill_in "Third party source", with: @capture_history.third_party_source
    click_on "Create Capture history"

    assert_text "Capture history was successfully created"
    click_on "Back"
  end

  test "updating a Capture history" do
    visit capture_histories_url
    click_on "Edit", match: :first

    fill_in "Barcode", with: @capture_history.barcode
    fill_in "Name", with: @capture_history.name
    fill_in "Status", with: @capture_history.status
    fill_in "Third party source", with: @capture_history.third_party_source
    click_on "Update Capture history"

    assert_text "Capture history was successfully updated"
    click_on "Back"
  end

  test "destroying a Capture history" do
    visit capture_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Capture history was successfully destroyed"
  end
end
