require "application_system_test_case"

class CompanySnapshotsTest < ApplicationSystemTestCase
  setup do
    @company_snapshot = company_snapshots(:one)
  end

  test "visiting the index" do
    visit company_snapshots_url
    assert_selector "h1", text: "Company Snapshots"
  end

  test "creating a Company snapshot" do
    visit company_snapshots_url
    click_on "New Company Snapshot"

    fill_in "Company", with: @company_snapshot.company_id
    fill_in "Data transparency", with: @company_snapshot.data_transparency
    fill_in "Internal culture", with: @company_snapshot.internal_culture
    fill_in "Mgmt composition", with: @company_snapshot.mgmt_composition
    click_on "Create Company snapshot"

    assert_text "Company snapshot was successfully created"
    click_on "Back"
  end

  test "updating a Company snapshot" do
    visit company_snapshots_url
    click_on "Edit", match: :first

    fill_in "Company", with: @company_snapshot.company_id
    fill_in "Data transparency", with: @company_snapshot.data_transparency
    fill_in "Internal culture", with: @company_snapshot.internal_culture
    fill_in "Mgmt composition", with: @company_snapshot.mgmt_composition
    click_on "Update Company snapshot"

    assert_text "Company snapshot was successfully updated"
    click_on "Back"
  end

  test "destroying a Company snapshot" do
    visit company_snapshots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company snapshot was successfully destroyed"
  end
end
