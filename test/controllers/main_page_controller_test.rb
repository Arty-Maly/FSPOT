require 'test_helper'

class MainPageControllerTest < ActionController::TestCase
  #if logged in should be able to get to closed parts
  test "should get access" do
    get :index
    assert_response :success
  end

  #if not logged in should not be able to get to closed parts
  test "should not get access" do
    logout
    get :index
    assert_response :redirect
  end
end
