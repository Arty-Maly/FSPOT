class MainPageController < ApplicationController	
  def index
    if(session[:user_id] == nil)
      flash[:notice] = "You must be logged in to view that page!"
      redirect_to root_path
    else
      @uploads = Upload.all
    end
  end


  def search_handler

    if params[:food] or params[:category] or params[:place]
        searchItem = params[:food]
        foodCatogory = params[:category]
        place = params[:place]

        # puts "------------------"
        # puts searchItem
        # puts foodCatogory
        # puts place

        @uploads = Upload.where(name: searchItem)

    else
        @uploads = Upload.all
    end

    respond_to do |format|
      format.json {
        render json: { response: "search successfully" }
      }
    end
    
  end

end
