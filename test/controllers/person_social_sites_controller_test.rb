require "test_helper"

class PersonSocialSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_social_site = person_social_sites(:one)
  end

  test "should get index" do
    get person_social_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_person_social_site_url
    assert_response :success
  end

  test "should create person_social_site" do
    assert_difference('PersonSocialSite.count') do
      post person_social_sites_url, 
params: { person_social_site: { person_id: @person_social_site.person_id, 
social_site_id: @person_social_site.social_site_id } }
    end

    assert_redirected_to person_social_site_url(PersonSocialSite.last)
  end

  test "should show person_social_site" do
    get person_social_site_url(@person_social_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_social_site_url(@person_social_site)
    assert_response :success
  end

  test "should update person_social_site" do
    patch person_social_site_url(@person_social_site), 
params: { person_social_site: { person_id: @person_social_site.person_id, 
social_site_id: @person_social_site.social_site_id } }
    assert_redirected_to person_social_site_url(@person_social_site)
  end

  test "should destroy person_social_site" do
    assert_difference('PersonSocialSite.count', -1) do
      delete person_social_site_url(@person_social_site)
    end

    assert_redirected_to person_social_sites_url
  end
end
