require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

  let (:user) { User.create(email: "test@test.com", password: "123456") }
  let (:resource) {Resource.create}
  let (:booking) { Booking.create(total_price: 12, date_from: Time.now + 1.hour, date_to: Time.now + 2.hour, resource_id: resource.id, user_id: user.id) }

  describe "POST #create" do

    subject { post :create, params: { booking_id: booking.id} }

    it 'sends post request' do
      expect { subject }.to change { Payment.count }.by 1
    end
  end

  describe "POST #update" do

    let (:payment) { Payment.create(booking_id: booking.id) }

    subject { post :update, params: { booking_id: booking.id, id: payment.id, payment:{status: "Done"} } }

    it 'sends post request' do
      subject
      expect(payment.reload.status).to eq "Done"
    end
  end

end
