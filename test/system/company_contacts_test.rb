require "application_system_test_case"

class CompanyContactsTest < ApplicationSystemTestCase
  setup do
    @company_contact = company_contacts(:one)
  end

  test "visiting the index" do
    visit company_contacts_url
    assert_selector "h1", text: "Company Contacts"
  end

  test "creating a Company contact" do
    visit company_contacts_url
    click_on "New Company Contact"

    fill_in "Company contact type", with: @company_contact.company_contact_type_id
    fill_in "Company", with: @company_contact.company_id
    fill_in "Email", with: @company_contact.email
    fill_in "Job title", with: @company_contact.job_title
    fill_in "Name", with: @company_contact.name
    fill_in "Phone", with: @company_contact.phone
    fill_in "Photo", with: @company_contact.photo
    click_on "Create Company contact"

    assert_text "Company contact was successfully created"
    click_on "Back"
  end

  test "updating a Company contact" do
    visit company_contacts_url
    click_on "Edit", match: :first

    fill_in "Company contact type", with: @company_contact.company_contact_type_id
    fill_in "Company", with: @company_contact.company_id
    fill_in "Email", with: @company_contact.email
    fill_in "Job title", with: @company_contact.job_title
    fill_in "Name", with: @company_contact.name
    fill_in "Phone", with: @company_contact.phone
    fill_in "Photo", with: @company_contact.photo
    click_on "Update Company contact"

    assert_text "Company contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Company contact" do
    visit company_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company contact was successfully destroyed"
  end
end
