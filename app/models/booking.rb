class Booking < ApplicationRecord
 # belongs_to :user
 # belongs_to :resource
 # belongs_to :payment
 validates :user_id, presence: true
 validates :resource_id, presence: true
 validates :payment_id, presence: true
 validates :date_from, presence: true
 validates :date_to, presence: true
 validates :total_price, numericality: { greater_than_or_equal_to: 0}, presence: true
 validate  :correct_date?

 def correct_date?
   if self.date_from < DateTime.now
     errors.add("Error", "Booking date can't be in the past")
   end
 end
end
