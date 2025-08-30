require "test_helper"

class CitRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cit_record = cit_records(:one)
  end

  test "should get index" do
    get cit_records_url
    assert_response :success
  end

  test "should get new" do
    get new_cit_record_url
    assert_response :success
  end

  test "should create cit_record" do
    assert_difference('CitRecord.count') do
      post cit_records_url, 
params: { cit_record: { company_id: @cit_record.company_id, company_name: @cit_record.company_name, 
level: @cit_record.level, mid: @cit_record.mid, product_activity_count: @cit_record.product_activity_count, product_orphan_count: @cit_record.product_orphan_count, source: @cit_record.source } }
    end

    assert_redirected_to cit_record_url(CitRecord.last)
  end

  test "should show cit_record" do
    get cit_record_url(@cit_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_cit_record_url(@cit_record)
    assert_response :success
  end

  test "should update cit_record" do
    patch cit_record_url(@cit_record), 
params: { cit_record: { company_id: @cit_record.company_id, company_name: @cit_record.company_name, 
level: @cit_record.level, mid: @cit_record.mid, product_activity_count: @cit_record.product_activity_count, product_orphan_count: @cit_record.product_orphan_count, source: @cit_record.source } }
    assert_redirected_to cit_record_url(@cit_record)
  end

  test "should destroy cit_record" do
    assert_difference('CitRecord.count', -1) do
      delete cit_record_url(@cit_record)
    end

    assert_redirected_to cit_records_url
  end
end
