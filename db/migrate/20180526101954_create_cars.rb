class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string  :name
      t.integer :price_per_h
      t.integer :car_rental_place_id

      t.timestamps
    end
  end
end
