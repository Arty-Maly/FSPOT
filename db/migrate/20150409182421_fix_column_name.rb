class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :restaurants, :name, :restaurant_name
  end
end
