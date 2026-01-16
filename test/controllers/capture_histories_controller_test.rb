require "test_helper"

class CaptureHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capture_history = capture_histories(:one)
  end

  test "should get index" do
    get capture_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_capture_history_url
    assert_response :success
  end

  test "should create capture_history" do
    assert_difference('CaptureHistory.count') do
      post capture_histories_url, params: { capture_history: { barcode: @capture_history.barcode, name: @capture_history.name, status: @capture_history.status, third_party_source: @capture_history.third_party_source } }
    end

    assert_redirected_to capture_history_url(CaptureHistory.last)
  end

  test "should show capture_history" do
    get capture_history_url(@capture_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_capture_history_url(@capture_history)
    assert_response :success
  end

  test "should update capture_history" do
    patch capture_history_url(@capture_history), params: { capture_history: { barcode: @capture_history.barcode, name: @capture_history.name, status: @capture_history.status, third_party_source: @capture_history.third_party_source } }
    assert_redirected_to capture_history_url(@capture_history)
  end

  test "should destroy capture_history" do
    assert_difference('CaptureHistory.count', -1) do
      delete capture_history_url(@capture_history)
    end

    assert_redirected_to capture_histories_url
  end
end
