class User < ApplicationRecord
  has_many :company_users
  has_many :companies, through: :company_users

  # Validations
  validates :name, presence: true
  validates :given_name, presence: true
  validates :family_name, presence: true
end
