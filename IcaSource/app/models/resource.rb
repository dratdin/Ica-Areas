class Resource < ActiveRecord::Base
	TYPES = ['Text', 'Link', 'Image', 'Video', 'Audio']
  has_attached_file :file
  has_attached_file :addition_file

	belongs_to :area
end
