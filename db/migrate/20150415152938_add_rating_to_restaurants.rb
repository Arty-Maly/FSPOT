class AddRatingToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :rating_img, :string
  	add_column :restaurants, :phone, :string
  end
end
