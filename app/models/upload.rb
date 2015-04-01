class Upload < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :picture, PictureUploader

  has_many :likes, dependent: :destroy
end
