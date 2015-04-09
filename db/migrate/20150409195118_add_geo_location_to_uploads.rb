class AddGeoLocationToUploads < ActiveRecord::Migration
  def change
  	add_column :uploads, :geo_location, :string
  end
end
