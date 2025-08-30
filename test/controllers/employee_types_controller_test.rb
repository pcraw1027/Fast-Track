require "test_helper"

class EmployeeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_type = employee_types(:one)
  end

  test "should get index" do
    get employee_types_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_type_url
    assert_response :success
  end

  test "should create employee_type" do
    assert_difference('EmployeeType.count') do
      post employee_types_url, 
params: { employee_type: { definition: @employee_type.definition, employee: @employee_type.employee } }
    end

    assert_redirected_to employee_type_url(EmployeeType.last)
  end

  test "should show employee_type" do
    get employee_type_url(@employee_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_type_url(@employee_type)
    assert_response :success
  end

  test "should update employee_type" do
    patch employee_type_url(@employee_type), 
params: { employee_type: { definition: @employee_type.definition, employee: @employee_type.employee } }
    assert_redirected_to employee_type_url(@employee_type)
  end

  test "should destroy employee_type" do
    assert_difference('EmployeeType.count', -1) do
      delete employee_type_url(@employee_type)
    end

    assert_redirected_to employee_types_url
  end
end
