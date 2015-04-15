class AddFriendsToNotification < ActiveRecord::Migration
  def change
  	add_column :notifications, :friends_id, :integer
  end
end
