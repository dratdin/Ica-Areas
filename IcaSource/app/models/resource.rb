class Resource < ActiveRecord::Base

  has_attached_file :file
  has_attached_file :addition_file

  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "file/gif"]
  validates :resource_type, presence: true
  validate :type_independet?

  belongs_to :area

  private
    def type_independet?
      case resource_type
        when 'Link'
          if %w(title text_content).all?{|attr| self[attr].blank?}
            errors.add :base, "Url can't be blank"
          end
        when 'Text'
          if %w(text_content).all?{|attr| self[attr].blank?}
            errors.add :base, "Text is empty"
          end
      end
    end
end
