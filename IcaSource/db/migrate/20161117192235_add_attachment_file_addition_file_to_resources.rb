class AddAttachmentFileAdditionFileToResources < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.attachment :file
      t.attachment :addition_file
    end
  end

  def self.down
    remove_attachment :resources, :file
    remove_attachment :resources, :addition_file
  end
end
