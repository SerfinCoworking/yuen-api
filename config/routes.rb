Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :account_types
  resources :accounts
end
