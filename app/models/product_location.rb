class ProductLocation < ApplicationRecord
  # Validations
  validates :name, presence: true 
end
