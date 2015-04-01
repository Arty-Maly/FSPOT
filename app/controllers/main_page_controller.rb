class MainPageController < ApplicationController	
  def index
    if(session[:user_id] == nil)
      flash[:notice] = "You must be logged in to view that page!"
      redirect_to root_path
    else
      if params[:search] or params[:foodCatogory] or params[:place]
        searchItem = params[:search]
        foodCatogory = params[:foodCatogory]
        place = params[:place]

        @uploads = Upload.where(name: searchItem)

      else
        @uploads = Upload.all
      end
    end
  end

  def search_handle
    
  end
end
