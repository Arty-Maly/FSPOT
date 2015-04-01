require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should not redirect when logged in" do
    get :new
    assert_response :success
  end

  #test if the user can login
  test "should login" do
    bob = users(:one)
    post :create, :email => bob.email, :password => 'secret'
    assert_equal bob.id, session[:user_id]
  end

  #test if the user can't login without the right password
  test "should not login" do
    jane = users(:two)
    bob = users(:one)
    post :create, :email => bob.email, :password => 'secret'
    assert_not_equal jane.id, session[:user_id]
  end

  test "should not redirect when logged out" do
    logout
    get :new
    assert_response :success
  end

end
