class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :resource_id
      t.integer :payment_id
      t.datetime :date_from
      t.datetime :date_to
      t.decimal :total_price

      t.timestamps
    end
  end
end
