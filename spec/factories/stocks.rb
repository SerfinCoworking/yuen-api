FactoryBot.define do
  factory :stock do
    product { nil }
    company { nil }
    location { nil }
    available_quantity { 1 }
    reserved { "" }
    total_quantity { 1 }
  end
end
