class AddLocationToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :location, :string
  end
end
