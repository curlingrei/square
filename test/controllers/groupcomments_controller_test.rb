require 'test_helper'

class GroupcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get groupcomments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get groupcomments_destroy_url
    assert_response :success
  end

end
