class MainPageController < ApplicationController	
  def index
    if(session[:user_id] == nil)
      flash[:notice] = "You must be logged in to view that page!"
      redirect_to root_path
    else
    	if params[:search]
    		@uploads = Upload.where(name: params[:search])
    	else
    		@uploads = Upload.all
    	end
    end
  end
end
