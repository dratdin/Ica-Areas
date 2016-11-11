class AddUserToAreas < ActiveRecord::Migration
  def change
  	add_belongs_to :areas, :user, index: true
  end
end
