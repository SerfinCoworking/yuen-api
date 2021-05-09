class StockLocation < ApplicationRecord
  belongs_to :company
  
  # Validations
  validates :name, presence: true
  validates :company, presence: true
end
