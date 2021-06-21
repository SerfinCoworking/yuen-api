class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :user, :company, :account_alias, :cbu, :description, :balance

  belongs_to :user
  belongs_to :company
end
