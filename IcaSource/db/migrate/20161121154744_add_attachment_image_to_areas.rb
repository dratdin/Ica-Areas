class AddAttachmentImageToAreas < ActiveRecord::Migration
  def self.up
    change_table :areas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :areas, :image
  end
end
