require "test_helper"

class AddressTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address_type = address_types(:one)
  end

  test "should get index" do
    get address_types_url
    assert_response :success
  end

  test "should get new" do
    get new_address_type_url
    assert_response :success
  end

  test "should create address_type" do
    assert_difference('AddressType.count') do
      post address_types_url, 
params: { address_type: { is_person_address: @address_type.is_person_address, name: @address_type.name } }
    end

    assert_redirected_to address_type_url(AddressType.last)
  end

  test "should show address_type" do
    get address_type_url(@address_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_type_url(@address_type)
    assert_response :success
  end

  test "should update address_type" do
    patch address_type_url(@address_type), 
params: { address_type: { is_person_address: @address_type.is_person_address, name: @address_type.name } }
    assert_redirected_to address_type_url(@address_type)
  end

  test "should destroy address_type" do
    assert_difference('AddressType.count', -1) do
      delete address_type_url(@address_type)
    end

    assert_redirected_to address_types_url
  end
end
