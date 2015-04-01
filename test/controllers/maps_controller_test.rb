require 'test_helper'

class MapsControllerTest < ActionController::TestCase

  test "should get access to map" do
    get :index
    assert_response :success
  end

end
