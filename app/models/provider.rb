class Provider < ApplicationRecord
  # Relationships
  belongs_to :company

  # Validations
  validates_presence_of :name, :email, :company
end
