require "test_helper"

class PitRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pit_record = pit_records(:one)
  end

  test "should get index" do
    get pit_records_url
    assert_response :success
  end

  test "should get new" do
    get new_pit_record_url
    assert_response :success
  end

  test "should create pit_record" do
    assert_difference('PitRecord.count') do
      post pit_records_url, params: { pit_record: { barcode: @pit_record.barcode, level: @pit_record.level, mid: @pit_record.mid, product_activity_count: @pit_record.product_activity_count, product_id: @pit_record.product_id, source: @pit_record.source } }
    end

    assert_redirected_to pit_record_url(PitRecord.last)
  end

  test "should show pit_record" do
    get pit_record_url(@pit_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_pit_record_url(@pit_record)
    assert_response :success
  end

  test "should update pit_record" do
    patch pit_record_url(@pit_record), params: { pit_record: { barcode: @pit_record.barcode, level: @pit_record.level, mid: @pit_record.mid, product_activity_count: @pit_record.product_activity_count, product_id: @pit_record.product_id, source: @pit_record.source } }
    assert_redirected_to pit_record_url(@pit_record)
  end

  test "should destroy pit_record" do
    assert_difference('PitRecord.count', -1) do
      delete pit_record_url(@pit_record)
    end

    assert_redirected_to pit_records_url
  end
end
