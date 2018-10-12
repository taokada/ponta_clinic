require 'test_helper'

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get aaa" do
    get comment_aaa_url
    assert_response :success
  end

end
