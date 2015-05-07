class Like < ActiveRecord::Base
  belongs_to :user 
  belongs_to :upload
  has_many :notifications

end
