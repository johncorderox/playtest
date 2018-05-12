require 'test_helper'

class TestersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testers_index_url
    assert_response :success
  end

  test "should get new" do
    get testers_new_url
    assert_response :success
  end

  test "should get create" do
    get testers_create_url
    assert_response :success
  end

  test "should get show" do
    get testers_show_url
    assert_response :success
  end

  test "should get update" do
    get testers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get testers_destroy_url
    assert_response :success
  end

end
