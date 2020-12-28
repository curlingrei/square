require 'test_helper'

class ParticipatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get participates_create_url
    assert_response :success
  end

  test "should get destroy" do
    get participates_destroy_url
    assert_response :success
  end

end
