require 'test_helper'

class GroupcommentlikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get groupcommentlikes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get groupcommentlikes_destroy_url
    assert_response :success
  end

end
