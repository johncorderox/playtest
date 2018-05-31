require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get logs_index_url
    assert_response :success
  end

  test "should get destroy" do
    get logs_destroy_url
    assert_response :success
  end

end
