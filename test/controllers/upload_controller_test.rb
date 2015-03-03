require 'test_helper'

class UploadControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should not get index" do
    logout
    get :index
    assert_response :redirect
  end
end
