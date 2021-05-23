FactoryBot.define do
  factory :user do
    picture { Faker::Avatar.image }
    name { Faker::Name.first_name }
    given_name { Faker::Name.name }
    family_name { Faker::Name.last_name }
  end
end
