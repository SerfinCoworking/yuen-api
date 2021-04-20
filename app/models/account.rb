class Account < ApplicationRecord
  # Relations
  belongs_to :user, optional: true
  belongs_to :account_type

  # Validations
  validates :name, presence: true
  validates :account_type, presence: true
  # validates :user, presence: true
end
