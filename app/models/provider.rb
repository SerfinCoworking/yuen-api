class Provider < ApplicationRecord
  include CompanyScope

  # Relationships
  belongs_to :company
  belongs_to :category, class_name: 'ProviderCategory'

  # Validations
  validates_presence_of :name, :email, :company_id, :category_id
end
