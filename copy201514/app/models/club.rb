class Club < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :manager, presence: true
	validates :category, presence: true
end
