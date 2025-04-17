require "application_system_test_case"

class CitRecordsTest < ApplicationSystemTestCase
  setup do
    @cit_record = cit_records(:one)
  end

  test "visiting the index" do
    visit cit_records_url
    assert_selector "h1", text: "Cit Records"
  end

  test "creating a Cit record" do
    visit cit_records_url
    click_on "New Cit Record"

    fill_in "Company", with: @cit_record.company_id
    fill_in "Company name", with: @cit_record.company_name
    fill_in "Level", with: @cit_record.level
    fill_in "Mid", with: @cit_record.mid
    fill_in "Product activity count", with: @cit_record.product_activity_count
    fill_in "Product orphan count", with: @cit_record.product_orphan_count
    fill_in "Source", with: @cit_record.source
    click_on "Create Cit record"

    assert_text "Cit record was successfully created"
    click_on "Back"
  end

  test "updating a Cit record" do
    visit cit_records_url
    click_on "Edit", match: :first

    fill_in "Company", with: @cit_record.company_id
    fill_in "Company name", with: @cit_record.company_name
    fill_in "Level", with: @cit_record.level
    fill_in "Mid", with: @cit_record.mid
    fill_in "Product activity count", with: @cit_record.product_activity_count
    fill_in "Product orphan count", with: @cit_record.product_orphan_count
    fill_in "Source", with: @cit_record.source
    click_on "Update Cit record"

    assert_text "Cit record was successfully updated"
    click_on "Back"
  end

  test "destroying a Cit record" do
    visit cit_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cit record was successfully destroyed"
  end
end
