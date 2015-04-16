class MainPageController < ApplicationController	

  def index

    if(session[:user_id] == nil)
        flash[:notice] = "You must be logged in to view that page!"
        redirect_to root_path

    else

        if params[:search] or params[:category] 

          searchItem = params[:search]
          category = params[:category]

          if category == "find the nearst dishes"
            search_nearest(searchItem, category)
          elsif category == "find the best dishes"
            search_best(searchItem, category)
          elsif category == "find the latest dishes"
            search_latest(searchItem, category)
          else
            search_item(searchItem)
          end

        else
            @uploads = Upload.all
            load_info
        end

    end

  end

  def search_nearest(searchItem, category)

      if searchItem

        @uploads = Upload.where("name LIKE ?", "%#{searchItem}%")

      else

        @uploads = Upload.first(20)

      end

      load_info

      @upload_search.sort_by! { |k| k[1]}

  end

  def search_best(searchItem, category)

        if searchItem

          @uploads = Upload.where("name LIKE ? ", "%#{searchItem}%").order('rating DESC')

        else

          @uploads = Upload.order('rating DESC')

        end

        load_info

  end

  def search_latest(searchItem, category)

        if searchItem

          @uploads = Upload.where("name LIKE ? ", "%#{searchItem}%").order('created_at DESC')

        else

          @uploads = Upload.order('created_at DESC')

        end

        load_info

  end

  def search_item(searchItem)

        if searchItem

          @uploads = Upload.where("name LIKE ?", "%#{searchItem}%")

        else

          @uploads = Upload.all

        end

        load_info

  end

 def find_distance(loc1, loc2)

      rad_per_deg = Math::PI/180  # PI / 180
      rkm = 6371                  # Earth radius in kilometers
      rm = rkm * 1000             # Radius in meters

      dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
      dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

      lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
      lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

      a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

      return (rm * c * 0.000621371).round(2) # Delta in meters

  end

  def load_info

      lat1 = session[:location][:lat]
      lng1 = session[:location][:lng]

      loc1 = [lat1.to_f, lng1.to_f]

      @upload_search = []

      @uploads.each do |upload|

          geo_location = upload.geo_location.split(',')
          lat2 = geo_location[0]
          lng2 = geo_location[1]
          loc2 = [lat2.to_f, lng2.to_f]

          d = find_distance(loc1, loc2)

          restaurant = Restaurant.find_by id: upload.restaurant_id

          restaurant_rating_url = restaurant.rating_img

          comments = Comment.where(upload_id: upload.id).first(5)

          likes = Like.where(upload_id: upload.id).count


          if comments == nil

            user_comment = []

          else

            user_comment = []

            comments.each do |comment|

              user = User.find(comment.user_id).email
              user_comment << [user, comment.description]

            end

          end

   
          @upload_search << [upload, d, restaurant.restaurant_name, restaurant.location, user_comment, likes, restaurant_rating_url]

      end 
  end



end
