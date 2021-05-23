class Account < ApplicationRecord
  # Relations
  belongs_to :user, optional: true
  belongs_to :account_type
  belongs_to :company

  # Validations
  validates :name, presence: true
  validates :account_type, presence: true
  validates :company, presence: true
  # validates :user, presence: true
end
