require 'test_helper'

class ResumeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resume_index_url
    assert_response :success
  end

  test "should get new" do
    get resume_new_url
    assert_response :success
  end

end
