class NotificationsController < ApplicationController

  def index
    
  	id = session[:user_id]
  	notifications = Notification.where(user_id: id)
  	@user_name = User.find(id).email
  	@user_like = {}
  	@user_comment = {}
  	@user_follow = []

  	notifications.each do |notification|

  		friends_id = notification.friends_id
  		user = User.find(friends_id).email

  		#someone likes your upload
  		unless notification.likes_id.nil?
        upload = Upload.find(notification.uploads_id).name
        img = Upload.find(notification.uploads_id).picture_url
        @user_like[user] = [upload, img]
  		end

  		#someone comments on your upload
  		unless notification.comments_id.nil?
  			comment = Comment.find(notification.comments_id).description
        upload = Upload.find(notification.comments_id).name
        img = Upload.find(notification.comments_id).picture_url
  			@user_comment[user] = [upload, comment, img]
  		end

  		#someone followed you
  		unless notification.relationships_id.nil?
  			@user_follow << user
  		end

	end
  
 end

end
