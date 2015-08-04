class Club < ActiveRecord::Base
  has_many :photos, inverse_of => :clu, :dependent => :destroy
  accepts_nested_attributes_for :photes, allow_destroy: true

  validates :picture, presence: true 
  validates :name, presence: true
  validates :category, presence: true
  validates :intro, presence: true
  validates :location, presence: true
  validates :history, presence: true
  validates :personnel, presence: true
  validates :phone, presence: true

  mount_uploader :picture, PictureUploader


      # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
