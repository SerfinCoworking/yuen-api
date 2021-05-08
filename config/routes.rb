Rails.application.routes.draw do
  resources :product_locations
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :product_categories
  resources :users
  resources :products
  resources :company_users
  resources :companies
  resources :account_types
  resources :accounts
end
