class AccountType < ApplicationRecord
  include CompanyScope

  # Relationships
  has_many :accounts
  belongs_to :company, optional: true

  # Validations
  validates_presence_of :name, :company
end
