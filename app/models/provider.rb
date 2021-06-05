class Provider < ApplicationRecord
  # Relationships
  belongs_to :company
  belongs_to :category, class_name: 'CategoryProvider'

  # Validations
  validates_presence_of :name, :email, :company_id, :category_id
end
