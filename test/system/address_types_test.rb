require "application_system_test_case"

class AddressTypesTest < ApplicationSystemTestCase
  setup do
    @address_type = address_types(:one)
  end

  test "visiting the index" do
    visit address_types_url
    assert_selector "h1", text: "Address Types"
  end

  test "creating a Address type" do
    visit address_types_url
    click_on "New Address Type"

    check "Is person address" if @address_type.is_person_address
    fill_in "Name", with: @address_type.name
    click_on "Create Address type"

    assert_text "Address type was successfully created"
    click_on "Back"
  end

  test "updating a Address type" do
    visit address_types_url
    click_on "Edit", match: :first

    check "Is person address" if @address_type.is_person_address
    fill_in "Name", with: @address_type.name
    click_on "Update Address type"

    assert_text "Address type was successfully updated"
    click_on "Back"
  end

  test "destroying a Address type" do
    visit address_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address type was successfully destroyed"
  end
end
