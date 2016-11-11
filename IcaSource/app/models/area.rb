class Area < ActiveRecord::Base
	#correct input
	validates :title, :description, :image_url, presence: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png|jpeg)\Z}i,
		message: 'URL must indicate to image with a format GIF, JPG or PNG.'
	}

	belongs_to :user
end
