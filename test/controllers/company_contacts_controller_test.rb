require "test_helper"

class CompanyContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_contact = company_contacts(:one)
  end

  test "should get index" do
    get company_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_company_contact_url
    assert_response :success
  end

  test "should create company_contact" do
    assert_difference('CompanyContact.count') do
      post company_contacts_url, params: { company_contact: { company_contact_type_id: @company_contact.company_contact_type_id, company_id: @company_contact.company_id, email: @company_contact.email, job_title: @company_contact.job_title, name: @company_contact.name, phone: @company_contact.phone, photo: @company_contact.photo } }
    end

    assert_redirected_to company_contact_url(CompanyContact.last)
  end

  test "should show company_contact" do
    get company_contact_url(@company_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_contact_url(@company_contact)
    assert_response :success
  end

  test "should update company_contact" do
    patch company_contact_url(@company_contact), params: { company_contact: { company_contact_type_id: @company_contact.company_contact_type_id, company_id: @company_contact.company_id, email: @company_contact.email, job_title: @company_contact.job_title, name: @company_contact.name, phone: @company_contact.phone, photo: @company_contact.photo } }
    assert_redirected_to company_contact_url(@company_contact)
  end

  test "should destroy company_contact" do
    assert_difference('CompanyContact.count', -1) do
      delete company_contact_url(@company_contact)
    end

    assert_redirected_to company_contacts_url
  end
end
