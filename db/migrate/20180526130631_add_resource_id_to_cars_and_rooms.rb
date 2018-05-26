class AddResourceIdToCarsAndRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :resource_id, :integer, index: true
    add_column :rooms, :resource_id, :integer, index: true
  end
end
