require 'test_helper'

class GuestLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get guest_login_create_url
    assert_response :success
  end

  test "should get destroy" do
    get guest_login_destroy_url
    assert_response :success
  end

end
