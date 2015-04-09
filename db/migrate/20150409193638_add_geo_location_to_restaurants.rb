class AddGeoLocationToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :geo_loaction, :string
  end
end
