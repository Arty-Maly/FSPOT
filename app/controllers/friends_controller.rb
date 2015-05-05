class FriendsController < ApplicationController
  def index		
    if params[:search]
      @users = User.where("email LIKE?", "%#{params[:search]}")
    else
      @users = nil
    end
      @uploads = Relationship.find(follower_id: session[:user_id])
      puts "==========="
      puts @upload
  end

  def follow
    user = (eval params[:user])

    User.find(session[:user_id]).follow(User.find(user))
    

    redirect_to "/friends"
  end

  def find_friend_handler

    @users = User.where("email LIKE?", "%#{params[:search]}")

    respond_to do |format|
      format.json {
        render json: {"find" => "successfully"}
      }
    end

  end

  def follow_friend_handler

    friends_id = params[:user_id]
    user_id = session[:user_id]

    relationship = Relationship.new(:follower_id => user_id,
                     :followed_id => friends_id)

    respond_to do |format|

      if relationship.save
        format.json {
          render json: {"follow" => "successfully"}
        }
      else
        format.json {
          render json: {"follow" => "unsuccessfully"}
        }
      end
    end
  end


end
