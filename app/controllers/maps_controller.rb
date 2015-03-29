class MapsController < ApplicationController

	require 'json'

	def index

		if params[:address]
			searchLocation = params[:address]
		else
			searchLocation = "Waltham"		
		end

		#find the data through yelp api
		#maximum of @nRow * @nCol <= 20
		@nRow = 6
		@nCol = 3 
		
		parameters = {term: 'food', limit: @nRow * @nCol }
		searchResult = Yelp.client.search(searchLocation, parameters)
		@searchArray = Array.new

		(0...@nRow * @nCol).each do |i|
			searchHash = { 'name' => searchResult.businesses[i].name, 'rating' => searchResult.businesses[i].rating,
						   'image_url' => searchResult.businesses[i].image_url, 'location' => searchResult.businesses[i].location.address }
			@searchArray << searchHash
		end	

		#render json: @searchArray
		puts @searchArray

	end

end
