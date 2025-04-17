require "test_helper"

class BitRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bit_record = bit_records(:one)
  end

  test "should get index" do
    get bit_records_url
    assert_response :success
  end

  test "should get new" do
    get new_bit_record_url
    assert_response :success
  end

  test "should create bit_record" do
    assert_difference('BitRecord.count') do
      post bit_records_url, params: { bit_record: { barcode: @bit_record.barcode, source: @bit_record.source, status: @bit_record.status } }
    end

    assert_redirected_to bit_record_url(BitRecord.last)
  end

  test "should show bit_record" do
    get bit_record_url(@bit_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_bit_record_url(@bit_record)
    assert_response :success
  end

  test "should update bit_record" do
    patch bit_record_url(@bit_record), params: { bit_record: { barcode: @bit_record.barcode, source: @bit_record.source, status: @bit_record.status } }
    assert_redirected_to bit_record_url(@bit_record)
  end

  test "should destroy bit_record" do
    assert_difference('BitRecord.count', -1) do
      delete bit_record_url(@bit_record)
    end

    assert_redirected_to bit_records_url
  end
end
