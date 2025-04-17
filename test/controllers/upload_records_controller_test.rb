require "test_helper"

class UploadRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upload_record = upload_records(:one)
  end

  test "should get index" do
    get upload_records_url
    assert_response :success
  end

  test "should get new" do
    get new_upload_record_url
    assert_response :success
  end

  test "should create upload_record" do
    assert_difference('UploadRecord.count') do
      post upload_records_url, params: { upload_record: { barcode: @upload_record.barcode, company_name: @upload_record.company_name, date: @upload_record.date, image: @upload_record.image, product_name: @upload_record.product_name, resolve_status: @upload_record.resolve_status, scan_id: @upload_record.scan_id, user_id: @upload_record.user_id, user_remarks: @upload_record.user_remarks } }
    end

    assert_redirected_to upload_record_url(UploadRecord.last)
  end

  test "should show upload_record" do
    get upload_record_url(@upload_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_upload_record_url(@upload_record)
    assert_response :success
  end

  test "should update upload_record" do
    patch upload_record_url(@upload_record), params: { upload_record: { barcode: @upload_record.barcode, company_name: @upload_record.company_name, date: @upload_record.date, image: @upload_record.image, product_name: @upload_record.product_name, resolve_status: @upload_record.resolve_status, scan_id: @upload_record.scan_id, user_id: @upload_record.user_id, user_remarks: @upload_record.user_remarks } }
    assert_redirected_to upload_record_url(@upload_record)
  end

  test "should destroy upload_record" do
    assert_difference('UploadRecord.count', -1) do
      delete upload_record_url(@upload_record)
    end

    assert_redirected_to upload_records_url
  end
end
