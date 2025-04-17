require "application_system_test_case"

class BitRecordsTest < ApplicationSystemTestCase
  setup do
    @bit_record = bit_records(:one)
  end

  test "visiting the index" do
    visit bit_records_url
    assert_selector "h1", text: "Bit Records"
  end

  test "creating a Bit record" do
    visit bit_records_url
    click_on "New Bit Record"

    fill_in "Barcode", with: @bit_record.barcode
    fill_in "Source", with: @bit_record.source
    fill_in "Status", with: @bit_record.status
    click_on "Create Bit record"

    assert_text "Bit record was successfully created"
    click_on "Back"
  end

  test "updating a Bit record" do
    visit bit_records_url
    click_on "Edit", match: :first

    fill_in "Barcode", with: @bit_record.barcode
    fill_in "Source", with: @bit_record.source
    fill_in "Status", with: @bit_record.status
    click_on "Update Bit record"

    assert_text "Bit record was successfully updated"
    click_on "Back"
  end

  test "destroying a Bit record" do
    visit bit_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bit record was successfully destroyed"
  end
end
