require 'test_helper'

class BooklikesControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get booklikes_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get booklikes_destroy_url
    assert_response :success
  end
end
