Rails.application.routes.draw do
  resources :company_users
  resources :companies
  resources :account_types
  resources :accounts
end
