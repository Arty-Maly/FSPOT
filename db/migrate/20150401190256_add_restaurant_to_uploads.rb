class AddRestaurantToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :restaurant, :string
  end
end
