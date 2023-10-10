require "test_helper"

class Instructor::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instructor_students_index_url
    assert_response :success
  end

  test "should get show" do
    get instructor_students_show_url
    assert_response :success
  end

  test "should get search" do
    get instructor_students_search_url
    assert_response :success
  end
end
