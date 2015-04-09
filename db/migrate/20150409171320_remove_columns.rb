class RemoveColumns < ActiveRecord::Migration
  def change
  	remove_column :uploads, :restaurant
  end
end
