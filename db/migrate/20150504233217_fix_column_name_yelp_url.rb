class FixColumnNameYelpUrl < ActiveRecord::Migration
  def change
    rename_column :restaurants, :yelpUrl, :yelp_url
  end
end
