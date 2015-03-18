class FriendsController < ApplicationController
	def index

		
		if params[:search]
    		@users = User.where(email: params[:search])
    	else
    		@users = User.all

    	end
	end

	def follow
		User.find(session[:user_id]).follow(User.find(params[:user]))
		User.find(params[:user]).follow(User.find(session[:user_id]))
		
	end


end
