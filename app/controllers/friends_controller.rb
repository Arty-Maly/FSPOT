class FriendsController < ApplicationController
  def index		
    if params[:search]
      @users = User.where(email: params[:search])
    else
      @users = User.all
    end
  end

  def follow
    user = (eval params[:user])

    User.find(session[:user_id]).follow(User.find(user))
    

    redirect_to "/friends"
  end
end
