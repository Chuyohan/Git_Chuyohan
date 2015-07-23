class Club < ActiveRecord::Base
  validates :picture, presence: true 
  validates :name, presence: true
  validates :category, presence: true
  validates :intro, presence: true
  validates :location, presence: true
  validates :history, presence: true
  validates :personnel, presence: true
  validates :phone, presence: true
end
