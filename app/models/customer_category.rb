class CustomerCategory < ApplicationRecord
  include CompanyScope

  # Relationships
  belongs_to :company
  has_many :customers, foreign_key: :category_id

  # Validations
  validates_presence_of :name, :company_id
end
