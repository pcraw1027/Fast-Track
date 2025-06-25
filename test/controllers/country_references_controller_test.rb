require "test_helper"

class CountryReferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_reference = country_references(:one)
  end

  test "should get index" do
    get country_references_url
    assert_response :success
  end

  test "should get new" do
    get new_country_reference_url
    assert_response :success
  end

  test "should create country_reference" do
    assert_difference('CountryReference.count') do
      post country_references_url, params: { country_reference: { country: @country_reference.country, country_code: @country_reference.country_code } }
    end

    assert_redirected_to country_reference_url(CountryReference.last)
  end

  test "should show country_reference" do
    get country_reference_url(@country_reference)
    assert_response :success
  end

  test "should get edit" do
    get edit_country_reference_url(@country_reference)
    assert_response :success
  end

  test "should update country_reference" do
    patch country_reference_url(@country_reference), params: { country_reference: { country: @country_reference.country, country_code: @country_reference.country_code } }
    assert_redirected_to country_reference_url(@country_reference)
  end

  test "should destroy country_reference" do
    assert_difference('CountryReference.count', -1) do
      delete country_reference_url(@country_reference)
    end

    assert_redirected_to country_references_url
  end
end
