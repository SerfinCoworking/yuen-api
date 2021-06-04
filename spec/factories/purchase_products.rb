FactoryBot.define do
  factory :purchase_product do
    purchase { nil }
    product { nil }
    quantity { 1 }
    presentation { 1 }
  end
end
