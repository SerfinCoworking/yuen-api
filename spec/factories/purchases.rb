FactoryBot.define do
  factory :purchase do
    provider { nil }
    company { nil }
    status { 1 }
    total_price { "9.99" }
  end
end
