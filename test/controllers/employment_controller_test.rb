require 'test_helper'

class EmploymentControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employment_show_url
    assert_response :success
  end

  test "should get new" do
    get employment_new_url
    assert_response :success
  end

  test "should get edit" do
    get employment_edit_url
    assert_response :success
  end

  test "should get create" do
    get employment_create_url
    assert_response :success
  end

  test "should get update" do
    get employment_update_url
    assert_response :success
  end

  test "should get destroy" do
    get employment_destroy_url
    assert_response :success
  end

end
