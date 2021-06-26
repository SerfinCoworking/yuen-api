class AccountType < ApplicationRecord

  # Relationships
  has_many :accounts
  belongs_to :company, optional: true

  # Validations
  validates_presence_of :name, :company

  scope :by_company, lambda { |a_company|
    where(company_id: nil).or(AccountType.where(company_id: a_company))
  }
end
