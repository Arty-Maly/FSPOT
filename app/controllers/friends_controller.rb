class FriendsController < ApplicationController
	def index

		
		if params[:search]
    		@users = User.where(email: params[:search])
    	else
    		@users = User.all

    	end
	end

	def follow
		puts "============================================="
		puts params[:user]
		redirect_to "/friends"
	end


end
