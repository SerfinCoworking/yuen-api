class AccountType < ApplicationRecord
  # Relations
  has_many :accounts

  # Validations
  validates :name, presence: true
end
