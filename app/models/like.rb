class Like < ActiveRecord::Base
  belongs_to :user 
  belongs_to :upload
  has_many :notifications

  # after_create :create_notification

  # private
  # def create_notification
  #   @upload = Upload.find_by(self.upload_id)
  #   @user = User.find_by(@upload.user_id).id
  #   Notification.create(
  #                       uploads_id: self.upload_id,
  #                       user_id: @user,
  #                       friends_id: self.user_id,
  #                       likes_id: self.id,
  #                       read: false
  #                      )
  # end
end
