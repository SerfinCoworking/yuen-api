class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone, :logo

  has_many :company_users
  has_many :users, through: :company_users
  has_many :products
  has_many :product_categories
  has_many :stock_locations
  has_many :accounts
  has_many :customers
  has_many :providers
end
