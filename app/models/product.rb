class Product < ApplicationRecord
  include CompanyScope

  # Relationships
  belongs_to :company
  belongs_to :category, class_name: 'ProductCategory'
  belongs_to :unity
  has_many :purchase_products
  has_many :purchases, through: :purchase_products

  # Validations
  validates_presence_of :name, :company_id, :category_id, :unity_id, :quantity_per_unit
end
