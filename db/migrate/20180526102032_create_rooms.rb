class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string  :name
      t.integer :price_per_night
      t.integer :no_of_beds
      t.integer :hotel_id

      t.timestamps
    end
  end
end
