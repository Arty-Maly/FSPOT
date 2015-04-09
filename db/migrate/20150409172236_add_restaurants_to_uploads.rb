class AddRestaurantsToUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :restaurant, index: true
  end
end
