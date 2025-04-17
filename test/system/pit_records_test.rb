require "application_system_test_case"

class PitRecordsTest < ApplicationSystemTestCase
  setup do
    @pit_record = pit_records(:one)
  end

  test "visiting the index" do
    visit pit_records_url
    assert_selector "h1", text: "Pit Records"
  end

  test "creating a Pit record" do
    visit pit_records_url
    click_on "New Pit Record"

    fill_in "Barcode", with: @pit_record.barcode
    fill_in "Level", with: @pit_record.level
    fill_in "Mid", with: @pit_record.mid
    fill_in "Product activity count", with: @pit_record.product_activity_count
    fill_in "Product", with: @pit_record.product_id
    fill_in "Source", with: @pit_record.source
    click_on "Create Pit record"

    assert_text "Pit record was successfully created"
    click_on "Back"
  end

  test "updating a Pit record" do
    visit pit_records_url
    click_on "Edit", match: :first

    fill_in "Barcode", with: @pit_record.barcode
    fill_in "Level", with: @pit_record.level
    fill_in "Mid", with: @pit_record.mid
    fill_in "Product activity count", with: @pit_record.product_activity_count
    fill_in "Product", with: @pit_record.product_id
    fill_in "Source", with: @pit_record.source
    click_on "Update Pit record"

    assert_text "Pit record was successfully updated"
    click_on "Back"
  end

  test "destroying a Pit record" do
    visit pit_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pit record was successfully destroyed"
  end
end
