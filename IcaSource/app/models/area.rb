class Area < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "file/gif"]
	belongs_to :user
	has_many :resources
end
