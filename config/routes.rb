Rails.application.routes.draw do
  resources :customers
  resources :stock_locations
  resources :product_categories
  resources :users
  resources :products
  resources :company_users
  resources :companies
  resources :account_types
  resources :accounts
end
