class RemoveImageUrlFromAreas < ActiveRecord::Migration
  def change
    remove_column :areas, :image_url
  end
end
