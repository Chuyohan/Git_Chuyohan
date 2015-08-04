class Club < ActiveRecord::Base
  has_many :albums
  
  validates :picture, presence: true 
  validates :name, presence: true
  validates :category, presence: true
  validates :intro, presence: true
  validates :location, presence: true
  validates :history, presence: true
  validates :personnel, presence: true
  validates :phone, presence: true

  mount_uploader :picture, PictureUploader

  def favorite
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    @clubs = Club.where("user_id IN (#{following_ids})", user_id: id)
  end

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
