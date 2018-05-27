FactoryBot.define do
  factory :resource do |f|
    # f.name { Faker::Name.first_name }
    # f.surname { Faker::Name.last_name }
    f.name 'Test Name'
  end
end
