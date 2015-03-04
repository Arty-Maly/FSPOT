require 'test_helper'

class MainPageControllerTest < ActionController::TestCase
  test "should get access" do
    get :index
    assert_response :success
  end

  test "should not get access" do
    logout
    get :index
    assert_response :redirect
  end
end
