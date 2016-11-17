class Area < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true

	belongs_to :user
	has_many :resources
end
