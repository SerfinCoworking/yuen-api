class CompanyUser < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :company

  # Validations
  validates_presence_of :user, :company
end
