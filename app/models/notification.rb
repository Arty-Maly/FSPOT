class Notification < ActiveRecord::Base
  belongs_to :comments
  belongs_to :likes
  belongs_to :relationships
  belongs_to :uploads
  belongs_to :user
end
