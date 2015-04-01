class AddRatingToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :rating, :integer
  end
end
