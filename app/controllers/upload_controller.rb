class UploadController < ApplicationController
  def index
    if(session[:user_id] == nil)
      flash[:notice] = "You must be logged in to view that page!"
      redirect_to log_in_path
    end
  end
end
