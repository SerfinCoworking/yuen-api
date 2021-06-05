Rails.application.routes.draw do
  resources :customer_categories
  resources :provider_categories
  resources :unities
  resources :providers
  resources :customers
  resources :stock_locations
  resources :users
  post 'auth/register', to: 'users#register'
  resources :products do
    collection do
      resources :product_categories, path: :categories
    end
  end
  resources :company_users
  resources :companies
  resources :account_types
  resources :accounts
end
