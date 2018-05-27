class RemovePaymentIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :payment_id, :integer
  end
end
