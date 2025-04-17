require "application_system_test_case"

class UploadRecordsTest < ApplicationSystemTestCase
  setup do
    @upload_record = upload_records(:one)
  end

  test "visiting the index" do
    visit upload_records_url
    assert_selector "h1", text: "Upload Records"
  end

  test "creating a Upload record" do
    visit upload_records_url
    click_on "New Upload Record"

    fill_in "Barcode", with: @upload_record.barcode
    fill_in "Company name", with: @upload_record.company_name
    fill_in "Date", with: @upload_record.date
    fill_in "Image", with: @upload_record.image
    fill_in "Product name", with: @upload_record.product_name
    check "Resolve status" if @upload_record.resolve_status
    fill_in "Scan", with: @upload_record.scan_id
    fill_in "User", with: @upload_record.user_id
    fill_in "User remarks", with: @upload_record.user_remarks
    click_on "Create Upload record"

    assert_text "Upload record was successfully created"
    click_on "Back"
  end

  test "updating a Upload record" do
    visit upload_records_url
    click_on "Edit", match: :first

    fill_in "Barcode", with: @upload_record.barcode
    fill_in "Company name", with: @upload_record.company_name
    fill_in "Date", with: @upload_record.date
    fill_in "Image", with: @upload_record.image
    fill_in "Product name", with: @upload_record.product_name
    check "Resolve status" if @upload_record.resolve_status
    fill_in "Scan", with: @upload_record.scan_id
    fill_in "User", with: @upload_record.user_id
    fill_in "User remarks", with: @upload_record.user_remarks
    click_on "Update Upload record"

    assert_text "Upload record was successfully updated"
    click_on "Back"
  end

  test "destroying a Upload record" do
    visit upload_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Upload record was successfully destroyed"
  end
end
