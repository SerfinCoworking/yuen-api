FactoryBot.define do
  factory :company_user do
    user factory: :user
    company factory: :company
  end
end
