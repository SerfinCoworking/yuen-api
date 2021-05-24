class User < ApplicationRecord
  has_many :company_users
  has_many :companies, through: :company_users
  belongs_to :current_company, class_name: 'Company'

  # Validations
  validates :name, presence: true
  validates :given_name, presence: true
  validates :family_name, presence: true
  validates :current_company, presence: true
end
