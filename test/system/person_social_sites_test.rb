require "application_system_test_case"

class PersonSocialSitesTest < ApplicationSystemTestCase
  setup do
    @person_social_site = person_social_sites(:one)
  end

  test "visiting the index" do
    visit person_social_sites_url
    assert_selector "h1", text: "Person Social Sites"
  end

  test "creating a Person social site" do
    visit person_social_sites_url
    click_on "New Person Social Site"

    fill_in "Person", with: @person_social_site.person_id
    fill_in "Social site", with: @person_social_site.social_site_id
    click_on "Create Person social site"

    assert_text "Person social site was successfully created"
    click_on "Back"
  end

  test "updating a Person social site" do
    visit person_social_sites_url
    click_on "Edit", match: :first

    fill_in "Person", with: @person_social_site.person_id
    fill_in "Social site", with: @person_social_site.social_site_id
    click_on "Update Person social site"

    assert_text "Person social site was successfully updated"
    click_on "Back"
  end

  test "destroying a Person social site" do
    visit person_social_sites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person social site was successfully destroyed"
  end
end
