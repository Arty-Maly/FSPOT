require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should not get index" do
    get :new
    assert_response :redirect
  end

  test "should get index" do
    logout
    get :new
    assert_response :success
  end
end
