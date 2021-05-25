class User < ApplicationRecord
  # Relationships
  has_many :company_users
  has_many :companies, through: :company_users
  belongs_to :current_company, class_name: 'Company'

  # Validations
  validates_presence_of :name, :given_name, :family_name, :current_company, :email, :auth0_id, :username
  validates_uniqueness_of :auth0_id
end
