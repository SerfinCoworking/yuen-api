class ProductCategory < ApplicationRecord
  # Relationships
  belongs_to :company
  belongs_to :parent, optional: true
  has_many :subcategories, class_name: 'ProductCategory', foreign_key: :parent_id
  has_many :products, foreign_key: :category_id

  # Validations
  validates_presence_of :name, :company_id
end
