Rails.application.routes.draw do
  resources :price_lists
  resources :unities
  resources :providers do
    collection do
      resources :provider_categories, path: :categories
    end
  end
  resources :customers do
    collection do
      resources :customer_categories, path: :categories
    end
  end
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
