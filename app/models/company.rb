class Company < ApplicationRecord
  # Relations
  has_many :company_users
  has_many :users, through: :company_users
  has_many :products
  has_many :product_categories
  has_many :stock_locations
  has_many :accounts
  has_many :customers

  # Validations
  validates :name, presence: true
end
