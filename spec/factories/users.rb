FactoryBot.define do
  factory :user do |f|
    # f.name { Faker::Name.first_name }
    # f.surname { Faker::Name.last_name }
    f.email { Faker::Internet.unique.free_email }
    f.password { Faker::Internet.password(8) }
  end
end
