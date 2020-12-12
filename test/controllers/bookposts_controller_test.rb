require 'test_helper'

class BookpostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bookposts_index_url
    assert_response :success
  end

  test 'should get show' do
    get bookposts_show_url
    assert_response :success
  end

  test 'should get new' do
    get bookposts_new_url
    assert_response :success
  end

  test 'should get create' do
    get bookposts_create_url
    assert_response :success
  end

  test 'should get edit' do
    get bookposts_edit_url
    assert_response :success
  end

  test 'should get update' do
    get bookposts_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get bookposts_destroy_url
    assert_response :success
  end
end
