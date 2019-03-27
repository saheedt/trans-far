require 'test_helper'

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get uploads_new_url
    assert_response :success
  end

  test "should get show" do
    get uploads_create_url
    assert_response :success
  end

  test "should get delete" do
    get uploads_delete_url
    assert_response :success
  end

  test "should get edit" do
    get uploads_edit_url
    assert_response :success
  end

  test "should get update" do
    get uploads_update_url
    assert_response :success
  end

end
