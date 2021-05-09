class CompanyUser < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :company

  # Validations
  validates :user, presence: true
  validates :company, presence: true
end
