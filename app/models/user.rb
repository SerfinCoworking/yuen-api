class User < ApplicationRecord
  has_many :company_users
  has_many :companies, through: :company_users

  # Validations
  validate :name, presence: true
  validate :givenname, presence: true
  validate :familyname, presence: true
end
