require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Country reference", with: @person.country_reference_id
    fill_in "Email", with: @person.email
    fill_in "Ethnicity type", with: @person.ethnicity_type_id
    fill_in "First name", with: @person.first_name
    fill_in "Gender type", with: @person.gender_type_id
    fill_in "Last name", with: @person.last_name
    fill_in "Letters", with: @person.letters
    fill_in "Middle name", with: @person.middle_name
    fill_in "Photo", with: @person.photo
    fill_in "Title", with: @person.title
    fill_in "Website", with: @person.website
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Country reference", with: @person.country_reference_id
    fill_in "Email", with: @person.email
    fill_in "Ethnicity type", with: @person.ethnicity_type_id
    fill_in "First name", with: @person.first_name
    fill_in "Gender type", with: @person.gender_type_id
    fill_in "Last name", with: @person.last_name
    fill_in "Letters", with: @person.letters
    fill_in "Middle name", with: @person.middle_name
    fill_in "Photo", with: @person.photo
    fill_in "Title", with: @person.title
    fill_in "Website", with: @person.website
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
