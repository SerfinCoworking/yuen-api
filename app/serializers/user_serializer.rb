class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :phone_number, :picture, :name, :nickname, :blocked, :given_name, :family_name,
             :current_company, :companies

  has_many :company_users
  has_many :companies, through: :company_users
  belongs_to :current_company, class_name: 'Company'
end
