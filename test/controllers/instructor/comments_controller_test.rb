require "test_helper"

class Instructor::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get instructor_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get instructor_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get instructor_comments_destroy_url
    assert_response :success
  end

  test "should get index" do
    get instructor_comments_index_url
    assert_response :success
  end
end
