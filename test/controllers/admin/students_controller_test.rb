require "test_helper"

class Admin::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_students_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_students_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_students_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_students_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_students_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_students_update_url
    assert_response :success
  end
end
