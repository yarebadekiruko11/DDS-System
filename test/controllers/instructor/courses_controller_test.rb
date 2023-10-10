require "test_helper"

class Instructor::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get instructor_courses_show_url
    assert_response :success
  end

  test "should get index" do
    get instructor_courses_index_url
    assert_response :success
  end
end
