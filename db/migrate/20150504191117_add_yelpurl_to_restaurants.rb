class AddYelpurlToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :yelpUrl, :string
  end
end
