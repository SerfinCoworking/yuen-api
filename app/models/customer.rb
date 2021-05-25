class Customer < ApplicationRecord
  # Relationships
  belongs_to :company

  # Validations
  validates_presence_of :first_name, :last_name, :email
end
