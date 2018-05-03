require 'test_helper'

class LogControllerTest < ActionDispatch::IntegrationTest
  test "should get error_log" do
    get log_error_log_url
    assert_response :success
  end

end
