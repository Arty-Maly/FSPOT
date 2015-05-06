class FriendsController < ApplicationController
  def index	
    if params[:search]
      @users = User.where("email LIKE?", "%#{params[:search]}")
    else
      @users = nil
    end
    search_friends

  end

  def follow
    user = (eval params[:user])

    User.find(session[:user_id]).follow(User.find(user))
    

    redirect_to "/friends"
  end

  def find_friend_handler

    @users = User.where("email LIKE?", "%#{params[:search]}")
    @uploads = []

    unless @users.nil?

      @user.each do |user|

        upload = Upload.where(user_id: user.id)

        unless upload.nil?

          upload.each do |img|
            @uploads << img
          end

        end

      end

    end

    respond_to do |format|
      format.json {
        render json: {"find" => "successfully"}
      }
    end

  end

  def follow_friend_handler

    relationship = Relationship.new(relationship_params)

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
    search_friends

  end

  def search_friends
      @uploads = []

      relationship = Relationship.where(follower_id: session[:user_id])

      unless relationship.nil?

        relationship.each do |r|

          upload = Upload.where(user_id: r.followed_id)
          unless upload.nil?

            upload.each do |img|
              @uploads << img
            end

          end
     
        end
      end

  end

  private
    def relationship_params
      params.permit(:follower_id, :followed_id)
    end

end
