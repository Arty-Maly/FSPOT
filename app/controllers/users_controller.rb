class UsersController < ApplicationController
  def new
    if(session[:user_id] != nil)
      redirect_to "/"
    end

    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the App!"
      redirect_to "/"
    else
      flash[:alert] = "Problem. Please Try again."
      redirect_to "back"
    end

  end

  private 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
