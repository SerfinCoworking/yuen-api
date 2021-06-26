class User < ApplicationRecord
  # Relationships
  has_many :company_users
  has_many :companies, through: :company_users
  belongs_to :current_company, class_name: 'Company'

  # Validations
  validates_presence_of :current_company_id, :email, :auth0_id
  validates_uniqueness_of :auth0_id
end
