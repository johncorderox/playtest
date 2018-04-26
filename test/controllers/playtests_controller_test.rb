require 'test_helper'

class PlaytestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get playtests_index_url
    assert_response :success
  end

  test "should get new" do
    get playtests_new_url
    assert_response :success
  end

  test "should get create" do
    get playtests_create_url
    assert_response :success
  end

  test "should get destroy" do
    get playtests_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get playtests_edit_url
    assert_response :success
  end

  test "should get update" do
    get playtests_update_url
    assert_response :success
  end

end
