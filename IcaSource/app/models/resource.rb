class Resource < ActiveRecord::Base
  has_attached_file :file
  has_attached_file :addition_file

  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "file/gif"]
  validate :type_independet?

  belongs_to :area

  private
    def type_independet?
      case @resource.resource_type
        when 'Link'
          validate :title, :text_content, :addition_file, presence: true
        when 'Image'
          validate :title, :text_content, :file, presence: true
        when 'Text'
          validate :title, :text_content, presence: true
      end
    end
end
