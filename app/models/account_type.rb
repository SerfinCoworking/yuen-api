class AccountType < ApplicationRecord
  # Relationships
  has_many :accounts

  # Validations
  validates_presence_of :name
end
