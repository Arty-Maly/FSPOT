class MapsController < ApplicationController

	require 'json'

	def index		
	end

	def maps_search_handler

		if params[:addr]
			searchLocation = params[:addr]
		else
			searchLocation = "Waltham"		
		end

		propFood = ['Salad','Sandwiches','Seafood','Pizza','Soup','Sushi Bars','Cupcakes','Desserts','Donuts',
					'Ice Cream & Frozen Yogurt','Coffee & Tea','Bagels','Bakeries','Beer, Wine & Spirits',
					'Chicken Wings','Cafes','Burgers','Breakfast & Brunch','Buffets']
		ret = {}
		limit = 20

		searchItem = propFood.grep(/#{params[:addr]}/)

		puts "==========="
		puts searchItem

		if searchItem.length > 0
			#find the data through yelp api		
			parameters = {term: searchItem, limit: limit }
			searchResult = Yelp.client.search('Boston', parameters)

		else

			#find the data through yelp api		
			parameters = {term: 'food', limit: limit }
			searchResult = Yelp.client.search(searchLocation, parameters)

		end


		searchArray = Array.new
		center_lat = 0
		center_lng = 0


		searchResult.businesses.each do |b|

			searchHash = {
				name: b.name.to_s,
				rating: b.rating,
				image_url: b.image_url,
				lat: b.location.coordinate.latitude.to_f,
				lng: b.location.coordinate.longitude.to_f,
				address: b.location.display_address,
				rating_image: b.rating_img_url,
				mobile_url: b.mobile_url

			}

			searchArray << searchHash

		end
	
		center_lat = searchArray.inject(0) { |sum, i| sum + i[:lat] } / searchArray.size
		center_lng = searchArray.inject(0) { |sum, i| sum + i[:lng] } / searchArray.size
 
		ret[:center] = {lat: center_lat, lng: center_lng}
		ret[:result] = searchArray

		respond_to do |format|
			format.json {
				render json: ret
			}
		end

	end
 

end
