class AccountType < ApplicationRecord
  # Relations
  has_many :accounts

  # Validations
  validates_presence_of :name
end
