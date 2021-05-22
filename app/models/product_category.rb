class ProductCategory < ApplicationRecord
  # Relations
  belongs_to :company_id
  belongs_to :parent, optional: true
  has_many :subcategories, class_name: 'ProductCategory', foreign_key: :parent_id
  has_many :products, foreign_key: :category_id

  # Validations
  validates :name, presence: true
  validates :company, presence: true
end
