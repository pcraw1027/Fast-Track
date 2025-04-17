require "application_system_test_case"

class EmployeeTypesTest < ApplicationSystemTestCase
  setup do
    @employee_type = employee_types(:one)
  end

  test "visiting the index" do
    visit employee_types_url
    assert_selector "h1", text: "Employee Types"
  end

  test "creating a Employee type" do
    visit employee_types_url
    click_on "New Employee Type"

    fill_in "Definition", with: @employee_type.definition
    fill_in "Employee", with: @employee_type.employee
    click_on "Create Employee type"

    assert_text "Employee type was successfully created"
    click_on "Back"
  end

  test "updating a Employee type" do
    visit employee_types_url
    click_on "Edit", match: :first

    fill_in "Definition", with: @employee_type.definition
    fill_in "Employee", with: @employee_type.employee
    click_on "Update Employee type"

    assert_text "Employee type was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee type" do
    visit employee_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee type was successfully destroyed"
  end
end
