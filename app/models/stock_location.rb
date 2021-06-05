class StockLocation < ApplicationRecord
  belongs_to :company
  
  # Validations
  validates_presence_of :name, :company_id
end
