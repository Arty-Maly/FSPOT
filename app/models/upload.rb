class Upload < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
