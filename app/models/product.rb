class Product < ApplicationRecord
  # Relations
  belongs_to :company
  belongs_to :category, class_name: 'ProductCategory'

  # Validations
  validates :name, presence: true
  validates :company, presence: true
  validates :category, presence: true
end
