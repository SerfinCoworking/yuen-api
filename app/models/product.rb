class Product < ApplicationRecord
  # Relations
  belongs_to :company
  belongs_to :category, class_name: 'ProductCategory'

  # Validations
  validates_presence_of :name, :company, :category
end
