require "test_helper"

class Admin::InstructorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_instructors_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_instructors_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_instructors_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_instructors_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_instructors_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_instructors_update_url
    assert_response :success
  end
end
