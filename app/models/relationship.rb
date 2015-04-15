class Relationship < ActiveRecord::Base

	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"

	has_many :notifications
	
	validates :follower_id, presence: true
 	validates :followed_id, presence: true

 	after_create :create_notification

	private
		def create_notification
			Notification.create(
				user_id: self.follower_id,
				friends_id: self.followed_id,
				relationships_id: self.id,
				read: false
				)
		end
end
