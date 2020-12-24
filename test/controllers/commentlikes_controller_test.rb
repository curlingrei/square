require 'test_helper'

class CommentlikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get commentlikes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get commentlikes_destroy_url
    assert_response :success
  end

end
