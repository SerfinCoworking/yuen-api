class Company < ApplicationRecord
  # Relationships
  has_many :company_users
  has_many :users, through: :company_users
  has_many :products
  has_many :product_categories
  has_many :stock_locations
  has_many :accounts
  has_many :customers
  has_many :providers

  # Validations
  validates_presence_of :name, :email
end
