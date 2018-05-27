6.times do
  FactoryBot.create(:user)
end

['Car', 'Hotel room', 'Laptop'].each do |resource|
  Resource.create(name: resource, description: Faker::Lorem.sentence)
end

User.all.each do |user|
  rand(5).times do
    Booking.create(user_id: user.id,
                   resource_id: Resource.all.sample.id,
                   date_from: Date.today + 1.day,
                   date_to: Date.today + 10.days,
                   total_price: rand(10.0..100.0))
  end
end

Booking.all.each do |booking|
  rand(3).times do
    Payment.create(booking_id: booking.id, amount: rand(10..300))

    puts '.'
  end
end
