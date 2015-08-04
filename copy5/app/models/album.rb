class Album < ActiveRecord::Base
 	belongs_to :club
 	
 	#validations
 	validates 	:image, presence: true
 	# Photo uploader using carrierwave
    mount_uploader :image, PictureUploader
end
