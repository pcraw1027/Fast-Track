require "test_helper"

class CompanySnapshotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_snapshot = company_snapshots(:one)
  end

  test "should get index" do
    get company_snapshots_url
    assert_response :success
  end

  test "should get new" do
    get new_company_snapshot_url
    assert_response :success
  end

  test "should create company_snapshot" do
    assert_difference('CompanySnapshot.count') do
      post company_snapshots_url, 
params: { company_snapshot: { company_id: @company_snapshot.company_id, 
data_transparency: @company_snapshot.data_transparency, internal_culture: @company_snapshot.internal_culture, mgmt_composition: @company_snapshot.mgmt_composition } }
    end

    assert_redirected_to company_snapshot_url(CompanySnapshot.last)
  end

  test "should show company_snapshot" do
    get company_snapshot_url(@company_snapshot)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_snapshot_url(@company_snapshot)
    assert_response :success
  end

  test "should update company_snapshot" do
    patch company_snapshot_url(@company_snapshot), 
params: { company_snapshot: { company_id: @company_snapshot.company_id, 
data_transparency: @company_snapshot.data_transparency, internal_culture: @company_snapshot.internal_culture, mgmt_composition: @company_snapshot.mgmt_composition } }
    assert_redirected_to company_snapshot_url(@company_snapshot)
  end

  test "should destroy company_snapshot" do
    assert_difference('CompanySnapshot.count', -1) do
      delete company_snapshot_url(@company_snapshot)
    end

    assert_redirected_to company_snapshots_url
  end
end
