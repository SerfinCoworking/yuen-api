class Product < ApplicationRecord
  # Relations
  belongs_to :company

  # Validations
  validates :name, presence: true
  validates :company, presence: true
end
