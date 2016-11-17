class AddAreaToResources < ActiveRecord::Migration
  def change
  	add_belongs_to :resources, :area, index: true
  end
end
