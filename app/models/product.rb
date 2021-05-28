class Product < ApplicationRecord
  # Relations
  belongs_to :company
  belongs_to :category, class_name: 'ProductCategory'
  belongs_to :unity

  # Validations
  validates_presence_of :name, :company, :category, :unity, :quantity_per_unit
end
