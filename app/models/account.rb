class Account < ApplicationRecord
  # Relationships
  belongs_to :account_type
  belongs_to :company

  # Validations
  validates_presence_of :name, :account_type, :company
end
