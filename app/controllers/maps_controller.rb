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

		ret = {}

		puts searchLocation

		limit = 20

		#find the data through yelp api		
		parameters = {term: 'food', limit: limit }
		searchResult = Yelp.client.search(searchLocation, parameters)
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
				address: b.location.address
			}
			searchArray << searchHash
		end
	
		center_lat = searchArray.inject(0) { |sum, i| sum + i[:lat] } / searchArray.size
		center_lng = searchArray.inject(0) { |sum, i| sum + i[:lng] } / searchArray.size
 
		ret[:center] = {lat: center_lat, lng: center_lng}
		ret[:result] = searchArray
		puts ret

		respond_to do |format|
			format.json {
				render json: ret
			}
		end
		
	end
 

end
