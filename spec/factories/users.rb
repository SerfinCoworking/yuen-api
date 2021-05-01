FactoryBot.define do
  factory :user do
    username { Faker::Artist.name }
  end
end
